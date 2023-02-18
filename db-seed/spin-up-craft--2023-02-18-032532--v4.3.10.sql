-- MariaDB dump 10.19  Distrib 10.6.12-MariaDB, for Linux (aarch64)
--
-- Host: mysql    Database: project
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `id` int NOT NULL,
  `ownerId` int DEFAULT NULL,
  `countryCode` varchar(255) NOT NULL,
  `administrativeArea` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `dependentLocality` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `sortingCode` varchar(255) DEFAULT NULL,
  `addressLine1` varchar(255) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `organizationTaxId` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_msabjvotpqgybymtyfljcwrvzrtnyhucxdav` (`ownerId`),
  CONSTRAINT `fk_dgkblzmegosoxlwxryjtdbhkrbfohigwbycg` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_msabjvotpqgybymtyfljcwrvzrtnyhucxdav` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `pluginId` int DEFAULT NULL,
  `heading` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_xvvdvfltlnmumqdrujwfrufypghpvyecfqib` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_wdonjwcjmusuiwvoxjfeqvnrnftiabwwhpnv` (`dateRead`),
  KEY `fk_mjbhbneargqbsylhjpocmgyrwhahsqucbfih` (`pluginId`),
  CONSTRAINT `fk_mjbhbneargqbsylhjpocmgyrwhahsqucbfih` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wgystrdsayywzgkmcnfxcpzowtnxzbmtqkmu` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexdata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sessionId` int NOT NULL,
  `volumeId` int NOT NULL,
  `uri` text,
  `size` bigint unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT '0',
  `recordId` int DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT '0',
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_pzstlrhsipfnhohqpmuiepofdzqiebfnuncm` (`sessionId`,`volumeId`),
  KEY `idx_lqzzfwwrxltemchtrojiagufiswghhycocoj` (`volumeId`),
  CONSTRAINT `fk_busfusgyqfapgbutswdeaoxhseomjesubbtz` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pkcwcinyyeqedaerwgyzcsklkawphwzwicvx` FOREIGN KEY (`sessionId`) REFERENCES `assetindexingsessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexingsessions`
--

DROP TABLE IF EXISTS `assetindexingsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexingsessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `indexedVolumes` text,
  `totalEntries` int DEFAULT NULL,
  `processedEntries` int NOT NULL DEFAULT '0',
  `cacheRemoteImages` tinyint(1) DEFAULT NULL,
  `isCli` tinyint(1) DEFAULT '0',
  `actionRequired` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets` (
  `id` int NOT NULL,
  `volumeId` int DEFAULT NULL,
  `folderId` int NOT NULL,
  `uploaderId` int DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `alt` text,
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `size` bigint unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_jfpmfprwdynjfcunafmabpkexubpvfnmnyxy` (`filename`,`folderId`),
  KEY `idx_tvmpndkodcjapkihljtxnjyazlyrcalysmwx` (`folderId`),
  KEY `idx_mienudqugtqiatgcegjyzvfzxdmpjnexdrmz` (`volumeId`),
  KEY `fk_hcfugtsjvppjnfwaiurnyechkavucrofubtu` (`uploaderId`),
  CONSTRAINT `fk_hcfugtsjvppjnfwaiurnyechkavucrofubtu` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_mvxjsllultcijerclhfbisuyaundnkhuilkh` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_odvvmufxpihhnilsjhhmgxtxyzobzjewkkqs` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pzxrsrqaciuhoselhftuwfnacvgvodqfuema` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_umkydtzwqczqfzkhykuxxdybdsjgvtwytrbz` (`groupId`),
  KEY `fk_xzyemizxpqidqfmpbgcurdmzovcatfetfdib` (`parentId`),
  CONSTRAINT `fk_dvocndwjriwdpuvynroefopaprhuumpxvcce` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qfeynhqczqrlzyyaupujzwgiervohcqtpmtv` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xzyemizxpqidqfmpbgcurdmzovcatfetfdib` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_bflpiuvhghruvcreinfpllgxkxrvbqgygcft` (`name`),
  KEY `idx_hwuoqmxtvkdbtxbbxoxksdtktbvtgobdebkd` (`handle`),
  KEY `idx_nxchuvfdzdsttmbzsqjofdzerhdiswingrkz` (`structureId`),
  KEY `idx_rdswxtefqkshrajrkijnrmmvdvdsumsbvpth` (`fieldLayoutId`),
  KEY `idx_wsouzqewrpejdecuulacewimvjumwdlvwype` (`dateDeleted`),
  CONSTRAINT `fk_dljxktjrqlxtasizqkgeftonbzhysiezdaly` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_fggpwcpbqluxdafddjhcvuokriaghmbbrlom` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_tinjymvugtldpeuewopukgxffauzydjyblck` (`groupId`,`siteId`),
  KEY `idx_dmmpzkhwbkheqtumvvapnzksgtmgikbdovnn` (`siteId`),
  CONSTRAINT `fk_ayrpclmevzovlbvsphacezpmkytwiqviqbnx` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_fqtxalxicwkumjcxhrqmcgsubipzxqjzhcyu` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedattributes` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_iuqqziobcmsnzimuaveaoxcnzjjhktqdvloc` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_zboeazmaubtyfisfnodtttbdlmtnnxrqggna` (`siteId`),
  KEY `fk_djtbtnstxblwgqynusjgvjxkudsiqviiospk` (`userId`),
  CONSTRAINT `fk_djtbtnstxblwgqynusjgvjxkudsiqviiospk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_qjgnmqqxtwqxpiyeavhtxpdtqcmebtqmhkph` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_zboeazmaubtyfisfnodtttbdlmtnnxrqggna` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedfields` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `fieldId` int NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `idx_dhspaagrufjcydckwfjpupecdgxzgswmfhfj` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_szmtdyzyzinmftywoguuovnrttiebtkredej` (`siteId`),
  KEY `fk_stuuzhstyyxgufqmcngnjsmzsyhlvromjxce` (`fieldId`),
  KEY `fk_nzvwouufkpbrzqhtlszzywtapoekcudlyoej` (`userId`),
  CONSTRAINT `fk_nzvwouufkpbrzqhtlszzywtapoekcudlyoej` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_ovpgrlcyyuimieptsacalrorxuyqkkpcbpds` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_stuuzhstyyxgufqmcngnjsmzsyhlvromjxce` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_szmtdyzyzinmftywoguuovnrttiebtkredej` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_jqzcffcvmftihrofdryftwugozjhktgjmowf` (`elementId`,`siteId`),
  KEY `idx_bgwnufnpfnfbmgdoqopioxdnmcrqpzcvkwit` (`siteId`),
  KEY `idx_rgrowoyqhhhtdbdzruigjzffxuavqtqeicid` (`title`),
  CONSTRAINT `fk_bqomwnmcsbqexhsrvlxcibreijzftpuhlrwp` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xsvqkvgigqgvjhiyogqkkwjkwxlflzzdyigl` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=402 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craftidtokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_ektfcaaepmlvdscierryrdgxgddoporfluft` (`userId`),
  CONSTRAINT `fk_ektfcaaepmlvdscierryrdgxgddoporfluft` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deprecationerrors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint unsigned DEFAULT NULL,
  `message` text,
  `traces` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ddtccbzofpndlamlrocvhoyicjxclrhjjjek` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drafts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `creatorId` int DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `notes` text,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_curwyhpvadatseawdryxhqsouklhgpvtqnfi` (`creatorId`,`provisional`),
  KEY `idx_jhjrorhssqwigiibsgvnsiymxkimnrxbkumo` (`saved`),
  KEY `fk_yoelqncjxhgfnsrreqjbmokgqugoonamzdnf` (`canonicalId`),
  CONSTRAINT `fk_sjxysysjhyppvvzfngazzyeqfcttdshgqiqq` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_yoelqncjxhgfnsrreqjbmokgqugoonamzdnf` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `draftId` int DEFAULT NULL,
  `revisionId` int DEFAULT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gtsmheywkesqhdkgspsqleecvbxoumglircg` (`dateDeleted`),
  KEY `idx_qqgybcxnkbajppipzkfxbbilqzkpzmtrpcpg` (`fieldLayoutId`),
  KEY `idx_wjvxofnyicpedlomeeqmpzuiporthduxtxdi` (`type`),
  KEY `idx_ienjfaqmhnpboqvjugxatypbrdpxajteugzg` (`enabled`),
  KEY `idx_votqatyhpfdkjgiyvocmwsmjoyaohehsnthz` (`archived`,`dateCreated`),
  KEY `idx_wanficubtvzuuwqjzrbmlgrjqhxvvjdicmzh` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `idx_eaeeimfsfcmdzcpsurjpmnscmrurjlqjosus` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `fk_hkvlwkjxtlrrayypwrumgozetdfvzzynnhpq` (`canonicalId`),
  KEY `fk_bsfildfwwphnwammekzzdnxpyfoyzkdzsgrr` (`draftId`),
  KEY `fk_gbdzoypkeufspxygkegkwzocvqlncyungygg` (`revisionId`),
  CONSTRAINT `fk_bsfildfwwphnwammekzzdnxpyfoyzkdzsgrr` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_gbdzoypkeufspxygkegkwzocvqlncyungygg` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hkvlwkjxtlrrayypwrumgozetdfvzzynnhpq` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_tqmyrnrvxyvveunghayaxxnnadifrtysefpa` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=402 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_hpdxtxcgefsyyatmwjnyuklkvaaxpwoekzpu` (`elementId`,`siteId`),
  KEY `idx_laiqjnniceelttilnnmjchqmynrtvcbuoaru` (`siteId`),
  KEY `idx_ofoxjbdnrsznxhyfdqpszhkxfqzhaarilody` (`slug`,`siteId`),
  KEY `idx_hnpltzcivigosragveapcznpacjdnedgdael` (`enabled`),
  KEY `idx_nynrfguuklmzqfbwqwwsghcqxcnztyybgeyy` (`uri`,`siteId`),
  CONSTRAINT `fk_kgzyxygnsnnvtdontfcthscuzxkjjxnebjpd` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qbtgabvbfiktiiswakthdhzsiiqgfxifcnsz` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=402 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entries` (
  `id` int NOT NULL,
  `sectionId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `typeId` int NOT NULL,
  `authorId` int DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_xbickxurytkhgbvsmyyvtxucfuueirdzqwev` (`postDate`),
  KEY `idx_urgqcomvjoruhyqecdmvczaizptdofxvkjra` (`expiryDate`),
  KEY `idx_loaufgdtfreoiblimqomupdyomfyhbecvfiq` (`authorId`),
  KEY `idx_eswztppsffqczyvvmzmxwwlzhqazdhuorkkb` (`sectionId`),
  KEY `idx_dmnsedghyviooycajhveibfuhjvwcxzlhhan` (`typeId`),
  KEY `fk_kbqvdhfkhqqunwmrsyvdomeqhxiekgepigis` (`parentId`),
  CONSTRAINT `fk_kbqvdhfkhqqunwmrsyvdomeqhxiekgepigis` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_oqbgakgfpwimmujvqytlrbyolrdgjqqnzprb` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_pbhovcuuxyporbardqfedhsqjtccipcyfecx` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ttaloxtlzsdjqefkakhtdckcjydfvyojpdkf` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yrviuyajjrrumhwtlmrupgyxggqgmihusnlj` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrytypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sectionId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `titleFormat` varchar(255) DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_oudlojczyyxeofdquysqhmrqtbcguianwbgp` (`name`,`sectionId`),
  KEY `idx_ofttkwjsjyuqzjltvdelrmqsccvluddguqno` (`handle`,`sectionId`),
  KEY `idx_eojzyjlmxeqywwzqbgiezqsxztzezvtdtazy` (`sectionId`),
  KEY `idx_rfnpufswriackxsbmehadyvwkbwpqztynkbt` (`fieldLayoutId`),
  KEY `idx_mktvketumtcfmvsufzibrsbamqcokdjnshwd` (`dateDeleted`),
  CONSTRAINT `fk_kbkxbyifnvxxtozcdugycwntwtsfaveqlhpm` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_xkpcldfuthhwfjeeqwtrezmfugsluibqdkaw` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldgroups`
--

DROP TABLE IF EXISTS `fieldgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldgroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_imwqoeblxzxjxivvckhfwkwcnsxjdotrikkc` (`name`),
  KEY `idx_vdcawaezccybhftaiexnzcmuiuzehobqssga` (`dateDeleted`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayoutfields`
--

DROP TABLE IF EXISTS `fieldlayoutfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayoutfields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `layoutId` int NOT NULL,
  `tabId` int NOT NULL,
  `fieldId` int NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_oujiwocvtwlxvnnadigozpuzqfrttylfdvew` (`layoutId`,`fieldId`),
  KEY `idx_usjbmsttnddzmcavmvzbuvlklbonlvwdzzlv` (`sortOrder`),
  KEY `idx_nidridlbfdcgpxvbdxrvwvdlsdknccpvzsmk` (`tabId`),
  KEY `idx_nutysbxdxxbeglaqcicnfkbcyqebxbmmsicw` (`fieldId`),
  CONSTRAINT `fk_kwtwxstkeeplxystqsbbeumynqzsssoiuvwn` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tqnxdvvhqykxjybbkvlxtiukwtdgvrvdpvgp` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ydzjxxjrpkirghprbozltqtpyqpwrlkrjugj` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_diixgfqdmrosirhncdxttjktqinuxabytsoa` (`dateDeleted`),
  KEY `idx_nbnbcrppsgzsqjkfcygumjtlsksygcxxgstk` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouttabs`
--

DROP TABLE IF EXISTS `fieldlayouttabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouttabs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `layoutId` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `settings` text,
  `elements` text,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_cgkrrpqvmuoewjgqikegegristhxdbrhnewm` (`sortOrder`),
  KEY `idx_pbnymoydnfsldjrpdqjvrhnonrycbfvqmxki` (`layoutId`),
  CONSTRAINT `fk_xfzilykajymmmdpezfvsdsbibikjsbpgjccv` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) DEFAULT NULL,
  `instructions` text,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_fjdwjydzxmgplyksgdfxccirnvqgqaxgkasz` (`handle`,`context`),
  KEY `idx_pxfrqqmdebjfjvarhcqhitilfnntpedtyphw` (`groupId`),
  KEY `idx_qdsbjuwemznsysnbpaqsloajrcwlrxoouyya` (`context`),
  CONSTRAINT `fk_ukoeadgflxsllkzthlrwrrtlmvhyanydwfts` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globalsets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lcegtfuoeqylravucwcqolvzztzpwhzwkrhv` (`name`),
  KEY `idx_phaeisfusfvhzurupuhpcqfoywmrwxwfzdvm` (`handle`),
  KEY `idx_yxplscnjrapyeasnamuqvnajceococalfyui` (`fieldLayoutId`),
  KEY `idx_wjhhkehfapvepuusdkhjryttjoxsotaklmjr` (`sortOrder`),
  CONSTRAINT `fk_bpfauhmvzvafveapnlylgnogzacgbxyrtzgf` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_tjrgoubhfyuxzuhwqjbzmcphcaspluikfumi` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqlschemas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `scope` text,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqltokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qrxtttpguhgnmowubepwsccsiqognurhfuhr` (`accessToken`),
  UNIQUE KEY `idx_zftdlfvqbkhwmqlyrlxnhkifoutvbzlmksvt` (`name`),
  KEY `fk_pgdydkmejezpzfmkqplzymxsifvbqwhwvehm` (`schemaId`),
  CONSTRAINT `fk_pgdydkmejezpzfmkqplzymxsifvbqwhwvehm` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransformindex`
--

DROP TABLE IF EXISTS `imagetransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagetransformindex` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assetId` int NOT NULL,
  `transformer` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `transformString` varchar(255) NOT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uozubtaczjmgounkzceydubgqxxjnhaoyqnq` (`assetId`,`transformString`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransforms`
--

DROP TABLE IF EXISTS `imagetransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagetransforms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_cvdoxggyqrozydzeilnvgsuiatwvezozieyp` (`name`),
  KEY `idx_bzlvvtwfxynqnfexgxxiinznucmauvhvjmxr` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocks`
--

DROP TABLE IF EXISTS `matrixblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocks` (
  `id` int NOT NULL,
  `primaryOwnerId` int NOT NULL,
  `fieldId` int NOT NULL,
  `typeId` int NOT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_lcgheyvlqbhhwdhxbozsfvnemndrohoahtja` (`primaryOwnerId`),
  KEY `idx_nbpjmalrzrbjuzjtonoecwqndcwhepsqrnsd` (`fieldId`),
  KEY `idx_knftlksklxxyswwjyglzjvfiebpmvmmehvbg` (`typeId`),
  CONSTRAINT `fk_fdvtfplkxpusezvohijyjeqxnxwntfukdxww` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mowckeoaqvlsdtxtkiitenhmnlgupxrsbofh` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uayurabdnscdjvhbgfkypzgxsjheoixzgrxj` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wrvhzxvrgjxzwdezcmyshpjkwmxufrenmoqe` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocks_owners`
--

DROP TABLE IF EXISTS `matrixblocks_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocks_owners` (
  `blockId` int NOT NULL,
  `ownerId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`blockId`,`ownerId`),
  KEY `fk_onshdkkpjryjzfcghhycgploqtmrupqpfvav` (`ownerId`),
  CONSTRAINT `fk_bewwjjxrtsezdkyleeahtnldlbbnerytnmpq` FOREIGN KEY (`blockId`) REFERENCES `matrixblocks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_onshdkkpjryjzfcghhycgploqtmrupqpfvav` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocktypes`
--

DROP TABLE IF EXISTS `matrixblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocktypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ypqcbdqoueybauqqgivxasjizlaajshrheml` (`name`,`fieldId`),
  KEY `idx_ncfyenrlxvwemlaheyusretnvazovhneptrt` (`handle`,`fieldId`),
  KEY `idx_dstofwgtxnehqhjieskqvdcnmangfnanmidk` (`fieldId`),
  KEY `idx_qfvowxlwvjfnkuwazckwgpyzyypwzrdpfzei` (`fieldLayoutId`),
  CONSTRAINT `fk_bomyvchgsezdenucronkkluqjrivoyrxepwu` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zbgnefgehceamrzgssdckvsqkoyejhkjpqxp` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_bwoitonatyluxwuitjyzgmluoqgbxasjjiup` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `licenseKeyStatus` enum('valid','trial','invalid','mismatched','astray','unknown') NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vuvauqxvdcciosbzvehxvnrpqngasulvjdkd` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int NOT NULL,
  `ttr` int NOT NULL,
  `delay` int NOT NULL DEFAULT '0',
  `priority` int unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int DEFAULT NULL,
  `progress` smallint NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text,
  PRIMARY KEY (`id`),
  KEY `idx_vcfkfdoxramrhqstyzfvlihfaupnsjkluxtm` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_uadakxmkzghrhcwiqlwvkcvejhvynyrgfvng` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=432 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `sourceId` int NOT NULL,
  `sourceSiteId` int DEFAULT NULL,
  `targetId` int NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_drobnvyajkynrbmkcooulabxcgghisdfxqow` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_crfnrsbokqcfjhfuifkwqmzkbblcaqiitirk` (`sourceId`),
  KEY `idx_casvyjipwiklphiwkocfuoyutkrmnebfayqj` (`targetId`),
  KEY `idx_buvzdxtoecztgmopusmrxqwgawbsjtiswflw` (`sourceSiteId`),
  CONSTRAINT `fk_byupggysxlkdqilhuciaazbiwgddmgjwftnp` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ggdrstfcnfvbtglryujhhkfihkqvlytdnldq` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ipycaijurbitmtrpacupumcnahxwqplzlwbd` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mdezuxjcusagbxgxiesfvuyinylkerxmxtij` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revisions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int NOT NULL,
  `creatorId` int DEFAULT NULL,
  `num` int NOT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_rpsotpuindomtnqizjqaowgjvdwultqaodrl` (`canonicalId`,`num`),
  KEY `fk_xcgsnamhhxxfcdfihibvnmsfwlxmxwxizsia` (`creatorId`),
  CONSTRAINT `fk_ncsbvlhkikkkrypibqljgwamlwyzasjercbk` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xcgsnamhhxxfcdfihibvnmsfwlxmxwxizsia` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searchindex` (
  `elementId` int NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int NOT NULL,
  `siteId` int NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_qtifyfqpijgdbmwkkqerfpydggonvzyjdwuz` (`keywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `previewTargets` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_vhzcobpdvxyrqrbrxwxclvsokayjnywincer` (`handle`),
  KEY `idx_ounocdtuxabltgkaqcitdandwyeoctzqpznt` (`name`),
  KEY `idx_mdcyhvxpudpcovusxxpbncqkfxjcerlfawod` (`structureId`),
  KEY `idx_avfauefjfcnxaayllprbomskbcfdnvmfnlkr` (`dateDeleted`),
  CONSTRAINT `fk_iixudohwzsevkmsesdtcfatdqllnnyomhlrc` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sectionId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ugkanpqmretdbjbrjszptmbzpsqcujiyezzc` (`sectionId`,`siteId`),
  KEY `idx_ewbibexjibphcsjzgltkfzejpjirastnqksf` (`siteId`),
  CONSTRAINT `fk_swpuvuduilgpgrofyncxvllvqlyhplsjdrdw` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ysymocxxldspfetuukxbjsgnnletszmhiqah` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_eoyjeqebjijvhysehazhglswvysnifxckzul` (`uid`),
  KEY `idx_foztuwjzdwrtrbsbygfiybjgjgauytnjkacq` (`token`),
  KEY `idx_yazneqmwxikhavqobhucihwgnflrdncmudzi` (`dateUpdated`),
  KEY `idx_oeujcbvyujkxarpuqhrldhvybvgkdiubxgys` (`userId`),
  CONSTRAINT `fk_tuhyhbgxqqomovzsxwiabcuitncpnjaxbcnf` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shunnedmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_gxmssnflplycfojhardquudwaaetzrteitnn` (`userId`,`message`),
  CONSTRAINT `fk_ocksebcmxnuruqdjxydsahnntfuuhfiewegm` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sitegroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ohkqjkhxdxmrbhpwxxwyrlvniducxqkdnldd` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` varchar(255) NOT NULL DEFAULT 'true',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(12) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_zqcmgnlmbzvpnavqpwneqdjynhvexbyvbexj` (`dateDeleted`),
  KEY `idx_glaqmdscmayinzbkqwskyqdtqiwqoncnggxf` (`handle`),
  KEY `idx_qevogplhncnlkfadbelqjwrzuqhujdibrdwv` (`sortOrder`),
  KEY `fk_tovfslllqdwlapmlncjxigccikdudlzwqbuy` (`groupId`),
  CONSTRAINT `fk_tovfslllqdwlapmlncjxigccikdudlzwqbuy` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structureelements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `elementId` int DEFAULT NULL,
  `root` int unsigned DEFAULT NULL,
  `lft` int unsigned NOT NULL,
  `rgt` int unsigned NOT NULL,
  `level` smallint unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_acfxgvxjezglpilxdzkdheapyprjfkjpymzl` (`structureId`,`elementId`),
  KEY `idx_lqjmynzqkpfrdegwxvztqxdktqcsnrijogle` (`root`),
  KEY `idx_gtudhyaetwugfayjydzmowtdoklwkhmofxmv` (`lft`),
  KEY `idx_irdskieztirzdrspwebajbzftsbhokqhaerg` (`rgt`),
  KEY `idx_fcvhhbptaksrarpxhzblxugwciksaffnstph` (`level`),
  KEY `idx_qpcpkqlyjkeppalkzkvkresvylvfhusbrbgo` (`elementId`),
  CONSTRAINT `fk_bxuutwhbochvepftcusxuficofxlvicrljfj` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pazvrrxkmmjfahwynrgetqhdpgddznysvbcw` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_zjyeakmqzcpfeivjaglxozperqulhqvumzry` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ucevqojawzwborkwvjwgsfcybbykorkzfzcx` (`key`,`language`),
  KEY `idx_yqurubbtmynqbgvfyhsltiilbxraaxtdhrfg` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_pbzdufsswnridwsvcvvvwpqhrtarjqqrqeom` (`name`),
  KEY `idx_cigkbgpemwaiqmejjqqozrzoslqwijwmffxf` (`handle`),
  KEY `idx_lyrdtdfnogxxfpyvqmeghabtrpyjshzrhbyb` (`dateDeleted`),
  KEY `fk_zzzfmeaiovlpglzisnmnjdeqopmfjzbczadf` (`fieldLayoutId`),
  CONSTRAINT `fk_zzzfmeaiovlpglzisnmnjdeqopmfjzbczadf` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_qmxiwsskrpdhpehpwzavuqcouswjiqyveuiz` (`groupId`),
  CONSTRAINT `fk_bsncminnekinqvfhsuwyyuvoyasewbujixca` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rnuixgjlpkrtdhlcsztvfsuvzwxwjebribcy` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint unsigned DEFAULT NULL,
  `usageCount` tinyint unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ksjayqxjenllhvsrcijcqekllpaainfelnwr` (`token`),
  KEY `idx_xydvfzqpqjmjctcjljgvrzudtnkgjccuvrks` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_oultxuqmrshfzkzeuvvfvzdtveebjsowvryt` (`handle`),
  KEY `idx_mnnejlifgwmksnurjzbmgaxasgwmtvukywty` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_txjpzwbdjjzejwutikmelanmcadawlswpvqm` (`groupId`,`userId`),
  KEY `idx_vriahrctfketywjhulmjvbmqxmmnigdcmcoy` (`userId`),
  CONSTRAINT `fk_bjauwyoxqbxevscsolngtfdimvpqxxmcuqoz` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_epjzskxcguxtmqwdnmclbuseazcotshkhzbj` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ahzokmcpdjljbtvgnmnevbgybztsdjbblirv` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `groupId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ixxxcatmboxsnkkjcmwicmpoaxhrtltfrqix` (`permissionId`,`groupId`),
  KEY `idx_xruyntxcskjslgrtzklebpzncwaxhpksfsra` (`groupId`),
  CONSTRAINT `fk_goxzzzrupxuxzidhbpmtxnehrryqosmldvme` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mucwcdryxhvbjbmqpieghmtjpkpfcxuqmcmn` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_kxetwhtoyvzesvjaqgfdyjpcnocntrdcolbs` (`permissionId`,`userId`),
  KEY `idx_kvloffvvabhsevkikqlzsjsrhrdzqhfsfyzu` (`userId`),
  CONSTRAINT `fk_qszjwuhobqeoofodprzptiawnwmyegdfekbg` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wtfacjjfkksjallznpcnwmugbemqwrqemszv` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpreferences` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `preferences` text,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_dgqmxwihecruwjvulfajoaeyyeuzrqydzknb` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int NOT NULL,
  `photoId` int DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_whhtlqdnasojfotsjgsfwhofwcrirrgebanq` (`active`),
  KEY `idx_vgjuuupdgvtxrchpvsfvutkwjchbyunkrpcm` (`locked`),
  KEY `idx_wslzawuwnkyiyoeusjzvhsjdqjshgkljgxfm` (`pending`),
  KEY `idx_qkimepwgickvaodroivqsftwbrylagnurcvp` (`suspended`),
  KEY `idx_ecyodzggbcbsxdjibjnxrckhiranlyhgcpft` (`verificationCode`),
  KEY `idx_duwcweslgdatyfwttebcrlzmvwtjihhknulv` (`email`),
  KEY `idx_wpcuagwrelorgdodrnbtzrhuxpsydxpxutbf` (`username`),
  KEY `fk_oekxohrklnsghmpspsxpvswjkzomcyhcgaer` (`photoId`),
  CONSTRAINT `fk_mjvmslgeiurroqcfnfqfktgoyszidvphnmta` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_oekxohrklnsghmpspsxpvswjkzomcyhcgaer` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumefolders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentId` int DEFAULT NULL,
  `volumeId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_bgzmvocibypmwkbudogieakwqmyydxvykkuk` (`name`,`parentId`,`volumeId`),
  KEY `idx_junmbourfkiquxjjwgsrjndrqwjbztinxzge` (`parentId`),
  KEY `idx_xxxbgiaowddczjqxaxqrrucolfqwzshbqpnw` (`volumeId`),
  CONSTRAINT `fk_knuxmiriggkdroxikcalkngkhrbyfuyfrcmi` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nocbtbjnheegqsrefgqgvwnujwjuyoiwzomp` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fs` varchar(255) NOT NULL,
  `transformFs` varchar(255) DEFAULT NULL,
  `transformSubpath` varchar(255) DEFAULT NULL,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tlfgayhaklkmadwyfhdmwppzrsplwkcoxlps` (`name`),
  KEY `idx_djldeizejicpbskculrwdfdylbevirlytlhg` (`handle`),
  KEY `idx_emvorgbvupdlscomjgtydgktupvuxgirruah` (`fieldLayoutId`),
  KEY `idx_asyqynflyuuxvsgaskmtnljcevfmwayiummn` (`dateDeleted`),
  CONSTRAINT `fk_mufrazjnhecngzahobbcjttwchrfejajdaxd` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widgets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `colspan` tinyint DEFAULT NULL,
  `settings` text,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qmprcbxpsoeusvovcspkwubvkrrbcjaohwbq` (`userId`),
  CONSTRAINT `fk_yetzzdnkpczkkuuskiervpkwvhkqovoembzi` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'project'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-18  3:25:33
-- MariaDB dump 10.19  Distrib 10.6.12-MariaDB, for Linux (aarch64)
--
-- Host: mysql    Database: project
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assetindexingsessions`
--

LOCK TABLES `assetindexingsessions` WRITE;
/*!40000 ALTER TABLE `assetindexingsessions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assetindexingsessions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `assets` VALUES (2,1,1,1,'rami.jpeg','image',NULL,1154,1490,193726,NULL,1,1,'2023-02-08 03:29:22','2023-02-08 03:29:22','2023-02-08 03:29:22'),(3,2,4,1,'rami.jpeg','image',NULL,1154,1490,193726,NULL,1,1,'2023-02-08 03:43:59','2023-02-08 03:43:59','2023-02-08 03:55:08'),(4,2,6,NULL,'Dashboard.js','javascript',NULL,NULL,NULL,16933,NULL,1,1,'2023-02-07 16:51:39','2023-02-08 03:54:58','2023-02-08 03:54:58'),(5,2,8,NULL,'xregexp-all.js.LICENSE.txt','text',NULL,NULL,NULL,1074,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:54:58','2023-02-08 03:54:58'),(6,2,8,NULL,'xregexp-all.js','javascript',NULL,NULL,NULL,93888,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:54:58','2023-02-08 03:54:58'),(7,2,9,NULL,'htmx.min.js','javascript',NULL,NULL,NULL,50182,NULL,1,1,'2023-02-08 03:28:27','2023-02-08 03:54:58','2023-02-08 03:54:58'),(8,2,12,NULL,'ar-OM.json','json',NULL,NULL,NULL,137,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:54:58','2023-02-08 03:54:58'),(9,2,12,NULL,'uk-UA.json','json',NULL,NULL,NULL,72,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:54:58','2023-02-08 03:54:58'),(10,2,12,NULL,'ar-QA.json','json',NULL,NULL,NULL,137,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:54:58','2023-02-08 03:54:58'),(11,2,12,NULL,'es-BO.json','json',NULL,NULL,NULL,86,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:54:59','2023-02-08 03:54:59'),(12,2,12,NULL,'en-US.json','json',NULL,NULL,NULL,66,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:54:59','2023-02-08 03:54:59'),(13,2,12,NULL,'ru-RU.json','json',NULL,NULL,NULL,75,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:54:59','2023-02-08 03:54:59'),(14,2,12,NULL,'ar-YE.json','json',NULL,NULL,NULL,137,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:54:59','2023-02-08 03:54:59'),(15,2,12,NULL,'ar-PS.json','json',NULL,NULL,NULL,134,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:54:59','2023-02-08 03:54:59'),(16,2,12,NULL,'pt-BR.json','json',NULL,NULL,NULL,67,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:54:59','2023-02-08 03:54:59'),(17,2,12,NULL,'ar-KW.json','json',NULL,NULL,NULL,137,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:54:59','2023-02-08 03:54:59'),(18,2,12,NULL,'pl-PL.json','json',NULL,NULL,NULL,68,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:54:59','2023-02-08 03:54:59'),(19,2,12,NULL,'ar-SD.json','json',NULL,NULL,NULL,137,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:54:59','2023-02-08 03:54:59'),(20,2,12,NULL,'ar-001.json','json',NULL,NULL,NULL,130,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:54:59','2023-02-08 03:54:59'),(21,2,12,NULL,'ar-MR.json','json',NULL,NULL,NULL,137,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:54:59','2023-02-08 03:54:59'),(22,2,12,NULL,'hu-HU.json','json',NULL,NULL,NULL,70,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:54:59','2023-02-08 03:54:59'),(23,2,12,NULL,'en-GB.json','json',NULL,NULL,NULL,67,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:54:59','2023-02-08 03:54:59'),(24,2,12,NULL,'en-CA.json','json',NULL,NULL,NULL,66,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:54:59','2023-02-08 03:54:59'),(25,2,12,NULL,'ar-ER.json','json',NULL,NULL,NULL,134,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:54:59','2023-02-08 03:54:59'),(26,2,12,NULL,'nl-NL.json','json',NULL,NULL,NULL,70,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:54:59','2023-02-08 03:54:59'),(27,2,12,NULL,'es-MX.json','json',NULL,NULL,NULL,66,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:54:59','2023-02-08 03:54:59'),(28,2,12,NULL,'sv-SE.json','json',NULL,NULL,NULL,69,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:54:59','2023-02-08 03:54:59'),(29,2,12,NULL,'ar-LB.json','json',NULL,NULL,NULL,137,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:54:59','2023-02-08 03:54:59'),(30,2,12,NULL,'ar-JO.json','json',NULL,NULL,NULL,137,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:54:59','2023-02-08 03:54:59'),(31,2,12,NULL,'fi-FI.json','json',NULL,NULL,NULL,71,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:54:59','2023-02-08 03:54:59'),(32,2,12,NULL,'zh-CN.json','json',NULL,NULL,NULL,67,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:54:59','2023-02-08 03:54:59'),(33,2,12,NULL,'ja-JP.json','json',NULL,NULL,NULL,68,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:54:59','2023-02-08 03:54:59'),(34,2,12,NULL,'ar-SO.json','json',NULL,NULL,NULL,135,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:54:59','2023-02-08 03:54:59'),(35,2,12,NULL,'en-IN.json','json',NULL,NULL,NULL,86,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:54:59','2023-02-08 03:54:59'),(36,2,12,NULL,'es-ES.json','json',NULL,NULL,NULL,70,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:00','2023-02-08 03:55:00'),(37,2,12,NULL,'ar-TN.json','json',NULL,NULL,NULL,72,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:00','2023-02-08 03:55:00'),(38,2,12,NULL,'fr-FR.json','json',NULL,NULL,NULL,88,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:00','2023-02-08 03:55:00'),(39,2,12,NULL,'he-IL.json','json',NULL,NULL,NULL,68,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:00','2023-02-08 03:55:00'),(40,2,12,NULL,'ar-EG.json','json',NULL,NULL,NULL,137,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:00','2023-02-08 03:55:00'),(41,2,12,NULL,'en-IE.json','json',NULL,NULL,NULL,68,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:00','2023-02-08 03:55:00'),(42,2,12,NULL,'mk-MK.json','json',NULL,NULL,NULL,74,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:00','2023-02-08 03:55:00'),(43,2,12,NULL,'ar-LY.json','json',NULL,NULL,NULL,72,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:00','2023-02-08 03:55:00'),(44,2,12,NULL,'ar-IQ.json','json',NULL,NULL,NULL,137,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:00','2023-02-08 03:55:00'),(45,2,12,NULL,'ar-MA.json','json',NULL,NULL,NULL,72,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:00','2023-02-08 03:55:00'),(46,2,12,NULL,'cs-CZ.json','json',NULL,NULL,NULL,71,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:00','2023-02-08 03:55:00'),(47,2,12,NULL,'de-DE.json','json',NULL,NULL,NULL,70,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:00','2023-02-08 03:55:00'),(48,2,12,NULL,'ar-SA.json','json',NULL,NULL,NULL,137,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:00','2023-02-08 03:55:00'),(49,2,12,NULL,'fr-CA.json','json',NULL,NULL,NULL,67,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:00','2023-02-08 03:55:00'),(50,2,12,NULL,'ar-DZ.json','json',NULL,NULL,NULL,72,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:00','2023-02-08 03:55:00'),(51,2,12,NULL,'ar-SY.json','json',NULL,NULL,NULL,137,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:00','2023-02-08 03:55:00'),(52,2,12,NULL,'ar-EH.json','json',NULL,NULL,NULL,72,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:00','2023-02-08 03:55:00'),(53,2,12,NULL,'ko-KR.json','json',NULL,NULL,NULL,68,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:00','2023-02-08 03:55:00'),(54,2,12,NULL,'de-CH.json','json',NULL,NULL,NULL,70,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:00','2023-02-08 03:55:00'),(55,2,12,NULL,'ar-BH.json','json',NULL,NULL,NULL,137,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:00','2023-02-08 03:55:00'),(56,2,12,NULL,'it-IT.json','json',NULL,NULL,NULL,68,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:00','2023-02-08 03:55:00'),(57,2,12,NULL,'ar-SS.json','json',NULL,NULL,NULL,133,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:00','2023-02-08 03:55:00'),(58,2,12,NULL,'ar-DJ.json','json',NULL,NULL,NULL,137,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:00','2023-02-08 03:55:00'),(59,2,12,NULL,'ar-IL.json','json',NULL,NULL,NULL,134,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:00','2023-02-08 03:55:00'),(60,2,12,NULL,'ar-AE.json','json',NULL,NULL,NULL,137,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:00','2023-02-08 03:55:00'),(61,2,12,NULL,'ar-TD.json','json',NULL,NULL,NULL,138,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:00','2023-02-08 03:55:00'),(62,2,12,NULL,'ar-KM.json','json',NULL,NULL,NULL,140,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:00','2023-02-08 03:55:00'),(63,2,12,NULL,'ca-ES.json','json',NULL,NULL,NULL,70,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:01','2023-02-08 03:55:01'),(64,2,14,NULL,'uk-UA.json','json',NULL,NULL,NULL,633,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:01','2023-02-08 03:55:01'),(65,2,14,NULL,'en-US.json','json',NULL,NULL,NULL,430,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:01','2023-02-08 03:55:01'),(66,2,14,NULL,'ru-RU.json','json',NULL,NULL,NULL,606,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:01','2023-02-08 03:55:01'),(67,2,14,NULL,'pt-BR.json','json',NULL,NULL,NULL,439,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:01','2023-02-08 03:55:01'),(68,2,14,NULL,'pl-PL.json','json',NULL,NULL,NULL,491,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:01','2023-02-08 03:55:01'),(69,2,14,NULL,'hu-HU.json','json',NULL,NULL,NULL,473,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:01','2023-02-08 03:55:01'),(70,2,14,NULL,'en-GB.json','json',NULL,NULL,NULL,432,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:01','2023-02-08 03:55:01'),(71,2,14,NULL,'en-CA.json','json',NULL,NULL,NULL,432,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:01','2023-02-08 03:55:01'),(72,2,14,NULL,'nl-NL.json','json',NULL,NULL,NULL,429,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:01','2023-02-08 03:55:01'),(73,2,14,NULL,'es-MX.json','json',NULL,NULL,NULL,431,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:01','2023-02-08 03:55:01'),(74,2,14,NULL,'sv-SE.json','json',NULL,NULL,NULL,435,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:01','2023-02-08 03:55:01'),(75,2,14,NULL,'tr-TR.json','json',NULL,NULL,NULL,431,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:01','2023-02-08 03:55:01'),(76,2,14,NULL,'fi-FI.json','json',NULL,NULL,NULL,494,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:01','2023-02-08 03:55:01'),(77,2,14,NULL,'zh-CN.json','json',NULL,NULL,NULL,523,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:01','2023-02-08 03:55:01'),(78,2,14,NULL,'ja-JP.json','json',NULL,NULL,NULL,431,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:01','2023-02-08 03:55:01'),(79,2,14,NULL,'fa-IR.json','json',NULL,NULL,NULL,655,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:01','2023-02-08 03:55:01'),(80,2,14,NULL,'es-ES.json','json',NULL,NULL,NULL,443,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:01','2023-02-08 03:55:01'),(81,2,14,NULL,'fr-FR.json','json',NULL,NULL,NULL,457,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:01','2023-02-08 03:55:01'),(82,2,14,NULL,'he-IL.json','json',NULL,NULL,NULL,554,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:01','2023-02-08 03:55:01'),(83,2,14,NULL,'ar-EG.json','json',NULL,NULL,NULL,653,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:01','2023-02-08 03:55:01'),(84,2,14,NULL,'mk-MK.json','json',NULL,NULL,NULL,610,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:01','2023-02-08 03:55:01'),(85,2,14,NULL,'cs-CZ.json','json',NULL,NULL,NULL,456,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:01','2023-02-08 03:55:01'),(86,2,14,NULL,'de-DE.json','json',NULL,NULL,NULL,433,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:01','2023-02-08 03:55:01'),(87,2,14,NULL,'fr-CA.json','json',NULL,NULL,NULL,428,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:01','2023-02-08 03:55:01'),(88,2,14,NULL,'ko-KR.json','json',NULL,NULL,NULL,445,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:02','2023-02-08 03:55:02'),(89,2,14,NULL,'de-CH.json','json',NULL,NULL,NULL,433,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:02','2023-02-08 03:55:02'),(90,2,14,NULL,'da-DK.json','json',NULL,NULL,NULL,432,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:02','2023-02-08 03:55:02'),(91,2,14,NULL,'it-IT.json','json',NULL,NULL,NULL,446,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:02','2023-02-08 03:55:02'),(92,2,14,NULL,'zh-TW.json','json',NULL,NULL,NULL,475,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:02','2023-02-08 03:55:02'),(93,2,14,NULL,'nb-NO.json','json',NULL,NULL,NULL,435,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:02','2023-02-08 03:55:02'),(94,2,14,NULL,'ca-ES.json','json',NULL,NULL,NULL,453,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:02','2023-02-08 03:55:02'),(95,2,10,NULL,'d3.js','javascript',NULL,NULL,NULL,222515,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:02','2023-02-08 03:55:02'),(96,2,15,NULL,'AssetIndexer.js','javascript',NULL,NULL,NULL,9950,NULL,1,1,'2023-02-08 03:54:55','2023-02-08 03:55:02','2023-02-08 03:55:02'),(97,2,16,NULL,'jquery-ui.js','javascript',NULL,NULL,NULL,56131,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:02','2023-02-08 03:55:02'),(98,2,16,NULL,'jquery-ui.js.LICENSE.txt','text',NULL,NULL,NULL,1315,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:02','2023-02-08 03:55:02'),(99,2,17,NULL,'tailwind_reset.js','javascript',NULL,NULL,NULL,3210,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:02','2023-02-08 03:55:02'),(100,2,19,NULL,'element-resize-detector.js','javascript',NULL,NULL,NULL,19189,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:02','2023-02-08 03:55:02'),(101,2,19,NULL,'element-resize-detector.js.LICENSE.txt','text',NULL,NULL,NULL,148,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:02','2023-02-08 03:55:02'),(102,2,20,NULL,'jquery.fileupload.js','javascript',NULL,NULL,NULL,18905,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:02','2023-02-08 03:55:02'),(103,2,21,NULL,'garnish.js','javascript',NULL,NULL,NULL,102763,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:02','2023-02-08 03:55:02'),(104,2,21,NULL,'garnish.js.LICENSE.txt','text',NULL,NULL,NULL,126,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:02','2023-02-08 03:55:02'),(105,2,22,NULL,'picturefill.js.LICENSE.txt','text',NULL,NULL,NULL,613,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:02','2023-02-08 03:55:02'),(106,2,22,NULL,'picturefill.js','javascript',NULL,NULL,NULL,11502,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:02','2023-02-08 03:55:02'),(107,2,23,NULL,'selectize.js','javascript',NULL,NULL,NULL,48302,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:03','2023-02-08 03:55:03'),(108,2,25,NULL,'jquery.payment.js','javascript',NULL,NULL,NULL,8412,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:03','2023-02-08 03:55:03'),(109,2,26,NULL,'login.js','javascript',NULL,NULL,NULL,6937,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:03','2023-02-08 03:55:03'),(110,2,28,NULL,'ConditionBuilder.js','javascript',NULL,NULL,NULL,330,NULL,1,1,'2023-02-08 03:28:27','2023-02-08 03:55:03','2023-02-08 03:55:03'),(111,2,29,NULL,'velocity.js','javascript',NULL,NULL,NULL,44583,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:03','2023-02-08 03:55:03'),(112,2,29,NULL,'velocity.js.LICENSE.txt','text',NULL,NULL,NULL,229,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:03','2023-02-08 03:55:03'),(113,2,30,NULL,'RecentEntriesWidget.js','javascript',NULL,NULL,NULL,1433,NULL,1,1,'2023-02-07 16:51:39','2023-02-08 03:55:03','2023-02-08 03:55:03'),(114,2,31,NULL,'fabric.js','javascript',NULL,NULL,NULL,261693,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:03','2023-02-08 03:55:03'),(115,2,31,NULL,'fabric.js.LICENSE.txt','text',NULL,NULL,NULL,78,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:03','2023-02-08 03:55:03'),(116,2,32,NULL,'manifest.json','json',NULL,NULL,NULL,78,NULL,1,1,'2023-02-08 03:28:25','2023-02-08 03:55:03','2023-02-08 03:55:03'),(117,2,33,NULL,'app.js','javascript',NULL,NULL,NULL,161702,NULL,1,1,'2023-02-08 03:28:25','2023-02-08 03:55:03','2023-02-08 03:55:03'),(118,2,33,NULL,'app.js.LICENSE.txt','text',NULL,NULL,NULL,462,NULL,1,1,'2023-02-08 03:28:25','2023-02-08 03:55:03','2023-02-08 03:55:03'),(119,2,36,NULL,'resizehandle_rtl_2x.png','image',NULL,26,26,343,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:04','2023-02-08 03:55:04'),(120,2,36,NULL,'resizehandle_rtl.png','image',NULL,14,14,212,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:04','2023-02-08 03:55:04'),(121,2,37,NULL,'chrome-tablet-bottom.svg','image',NULL,768,55,680,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:04','2023-02-08 03:55:04'),(122,2,37,NULL,'icon-phone.svg','image',NULL,13,28,680,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:04','2023-02-08 03:55:04'),(123,2,37,NULL,'icon-desktop.svg','image',NULL,34,28,927,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:04','2023-02-08 03:55:04'),(124,2,37,NULL,'chrome-phone-bottom.svg','image',NULL,375,55,680,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:04','2023-02-08 03:55:04'),(125,2,37,NULL,'icon-tablet.svg','image',NULL,19,28,694,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:04','2023-02-08 03:55:04'),(126,2,37,NULL,'chrome-tablet-top.svg','image',NULL,768,31,666,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:04','2023-02-08 03:55:04'),(127,2,37,NULL,'chrome-phone-top.svg','image',NULL,375,31,784,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:04','2023-02-08 03:55:04'),(128,2,36,NULL,'hudtip_right.png','image',NULL,15,30,1146,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:04','2023-02-08 03:55:04'),(129,2,36,NULL,'user.svg','image',NULL,1000,1000,1626,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:04','2023-02-08 03:55:04'),(130,2,36,NULL,'welcome_logo_2x.png','image',NULL,416,332,7091,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:04','2023-02-08 03:55:04'),(131,2,36,NULL,'temp_folder.png','image',NULL,96,78,10923,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:04','2023-02-08 03:55:04'),(132,2,36,NULL,'craft.png','image',NULL,202,106,3314,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:04','2023-02-08 03:55:04'),(133,2,36,NULL,'hudtip_bottom.png','image',NULL,30,15,1134,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:04','2023-02-08 03:55:04'),(134,2,36,NULL,'hudtip_bottom_gray_2x.png','image',NULL,60,30,1330,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:04','2023-02-08 03:55:04'),(135,2,36,NULL,'listview_sort_2x.png','image',NULL,52,124,1420,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:04','2023-02-08 03:55:04'),(136,2,36,NULL,'welcome_logo.png','image',NULL,208,166,5319,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:04','2023-02-08 03:55:04'),(137,2,36,NULL,'resizehandle_2x.png','image',NULL,26,26,318,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:04','2023-02-08 03:55:04'),(138,2,36,NULL,'hudtip_top_2x.png','image',NULL,60,30,1236,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:04','2023-02-08 03:55:04'),(139,2,36,NULL,'hudtip_top.png','image',NULL,30,15,1112,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:04','2023-02-08 03:55:04'),(140,2,36,NULL,'resizehandle.png','image',NULL,14,14,227,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:04','2023-02-08 03:55:04'),(141,2,38,NULL,'safari-pinned-tab.svg','image',NULL,700,700,1445,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:05','2023-02-08 03:55:05'),(142,2,38,NULL,'icon.svg','image',NULL,100,100,846,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:05','2023-02-08 03:55:05'),(143,2,38,NULL,'apple-touch-icon.png','image',NULL,180,180,3805,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:05','2023-02-08 03:55:05'),(144,2,36,NULL,'success.png','image',NULL,48,48,1150,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:05','2023-02-08 03:55:05'),(145,2,39,NULL,'filters.svg','image',NULL,24,24,833,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:05','2023-02-08 03:55:05'),(146,2,39,NULL,'orientation-landscape-unchecked.svg','image',NULL,32,22,753,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:05','2023-02-08 03:55:05'),(147,2,39,NULL,'flip-horizontal.svg','image',NULL,24,24,1157,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:05','2023-02-08 03:55:05'),(148,2,39,NULL,'check.svg','image',NULL,15,11,983,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:05','2023-02-08 03:55:05'),(149,2,39,NULL,'flip-vertical.svg','image',NULL,24,24,1245,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:05','2023-02-08 03:55:05'),(150,2,39,NULL,'orientation-landscape-checked.svg','image',NULL,32,22,1318,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:05','2023-02-08 03:55:05'),(151,2,39,NULL,'focal-point.svg','image',NULL,24,24,1090,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:05','2023-02-08 03:55:05'),(152,2,39,NULL,'crop.svg','image',NULL,24,24,828,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:05','2023-02-08 03:55:05'),(153,2,39,NULL,'unconstrained.svg','image',NULL,24,24,898,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:05','2023-02-08 03:55:05'),(154,2,39,NULL,'rotate-left.svg','image',NULL,24,24,1020,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:05','2023-02-08 03:55:05'),(155,2,39,NULL,'orientation-portrait-unchecked.svg','image',NULL,22,32,651,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:05','2023-02-08 03:55:05'),(156,2,39,NULL,'rotate-right.svg','image',NULL,24,24,1101,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:05','2023-02-08 03:55:05'),(157,2,39,NULL,'orientation-portrait-checked.svg','image',NULL,22,32,1218,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:05','2023-02-08 03:55:05'),(158,2,36,NULL,'prg.jpg','image',NULL,500,308,43114,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:05','2023-02-08 03:55:05'),(159,2,36,NULL,'hudtip_left.png','image',NULL,15,30,1120,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:05','2023-02-08 03:55:05'),(160,2,36,NULL,'success_2x.png','image',NULL,96,96,2352,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:05','2023-02-08 03:55:05'),(161,2,36,NULL,'hudtip_bottom_2x.png','image',NULL,60,30,1310,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:05','2023-02-08 03:55:05'),(162,2,36,NULL,'craftcms.svg','image',NULL,104,26,5747,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:05','2023-02-08 03:55:05'),(163,2,36,NULL,'hudtip_left_2x.png','image',NULL,30,60,1333,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:05','2023-02-08 03:55:05'),(164,2,36,NULL,'dev-mode.svg','image',NULL,40,5,751,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:05','2023-02-08 03:55:05'),(165,2,36,NULL,'branch_rtl.png','image',NULL,40,15,1415,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:05','2023-02-08 03:55:05'),(166,2,36,NULL,'craft_2x.png','image',NULL,404,212,7302,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:05','2023-02-08 03:55:05'),(167,2,36,NULL,'listview_sort.png','image',NULL,26,62,1200,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:06','2023-02-08 03:55:06'),(168,2,36,NULL,'branch_rtl_2x.png','image',NULL,80,30,1465,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:06','2023-02-08 03:55:06'),(169,2,36,NULL,'hudtip_right_2x.png','image',NULL,30,60,1330,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:06','2023-02-08 03:55:06'),(170,2,36,NULL,'branch.png','image',NULL,40,15,1418,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:06','2023-02-08 03:55:06'),(171,2,36,NULL,'hudtip_bottom_gray.png','image',NULL,30,15,1183,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:06','2023-02-08 03:55:06'),(172,2,36,NULL,'branch_2x.png','image',NULL,80,30,1468,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:06','2023-02-08 03:55:06'),(173,2,35,NULL,'cp.js','javascript',NULL,NULL,NULL,520341,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:06','2023-02-08 03:55:06'),(174,2,40,NULL,'Craft.svg','image',NULL,100,100,169386,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:06','2023-02-08 03:55:06'),(175,2,42,NULL,'FeedWidget.js','javascript',NULL,NULL,NULL,933,NULL,1,1,'2023-02-07 16:51:39','2023-02-08 03:55:06','2023-02-08 03:55:06'),(176,2,43,NULL,'UpdatesWidget.js','javascript',NULL,NULL,NULL,1431,NULL,1,1,'2023-02-07 16:51:39','2023-02-08 03:55:06','2023-02-08 03:55:06'),(177,2,44,NULL,'axios.js.LICENSE.txt','text',NULL,NULL,NULL,4944,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:06','2023-02-08 03:55:06'),(178,2,44,NULL,'axios.js','javascript',NULL,NULL,NULL,23120,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:06','2023-02-08 03:55:06'),(179,2,45,NULL,'jquery.mobile-events.js','javascript',NULL,NULL,NULL,15783,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:06','2023-02-08 03:55:06'),(180,2,45,NULL,'jquery.mobile-events.js.LICENSE.txt','text',NULL,NULL,NULL,1200,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:06','2023-02-08 03:55:06'),(181,2,46,NULL,'iframeResizer.contentWindow.js','javascript',NULL,NULL,NULL,13313,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:06','2023-02-08 03:55:06'),(182,2,46,NULL,'iframeResizer.js','javascript',NULL,NULL,NULL,13762,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:07','2023-02-08 03:55:07'),(183,2,48,NULL,'db.png','image',NULL,736,953,52504,NULL,1,1,'2023-02-07 16:51:29','2023-02-08 03:55:07','2023-02-08 03:55:07'),(184,2,48,NULL,'account.png','image',NULL,736,953,49350,NULL,1,1,'2023-02-07 16:51:29','2023-02-08 03:55:07','2023-02-08 03:55:07'),(185,2,48,NULL,'site.png','image',NULL,736,953,62301,NULL,1,1,'2023-02-07 16:51:29','2023-02-08 03:55:07','2023-02-08 03:55:07'),(186,2,48,NULL,'installer-bg.png','image',NULL,3000,1690,234891,NULL,1,1,'2023-02-07 16:51:29','2023-02-08 03:55:07','2023-02-08 03:55:07'),(187,2,47,NULL,'install.js','javascript',NULL,NULL,NULL,7203,NULL,1,1,'2023-02-07 16:51:29','2023-02-08 03:55:07','2023-02-08 03:55:07'),(188,2,50,NULL,'prism.js','javascript',NULL,NULL,NULL,17569,NULL,1,1,'2023-02-08 03:29:10','2023-02-08 03:55:07','2023-02-08 03:55:07'),(189,2,51,NULL,'jquery.js.LICENSE.txt','text',NULL,NULL,NULL,475,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:07','2023-02-08 03:55:07'),(190,2,51,NULL,'jquery.js','javascript',NULL,NULL,NULL,90123,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 03:55:07','2023-02-08 03:55:07'),(191,2,52,NULL,'vue.js','javascript',NULL,NULL,NULL,161014,NULL,1,1,'2023-02-08 03:28:25','2023-02-08 03:55:07','2023-02-08 03:55:07'),(192,2,52,NULL,'vue.js.LICENSE.txt','text',NULL,NULL,NULL,158,NULL,1,1,'2023-02-08 03:28:25','2023-02-08 03:55:07','2023-02-08 03:55:07'),(193,2,53,NULL,'manifest.json','json',NULL,NULL,NULL,87,NULL,1,1,'2023-02-08 03:54:02','2023-02-08 03:55:08','2023-02-08 03:55:08'),(194,2,53,NULL,'queue-manager.js','javascript',NULL,NULL,NULL,4639,NULL,1,1,'2023-02-08 03:54:02','2023-02-08 03:55:08','2023-02-08 03:55:08'),(195,2,53,NULL,'queue-manager.js.LICENSE.txt','text',NULL,NULL,NULL,135,NULL,1,1,'2023-02-08 03:54:02','2023-02-08 03:55:08','2023-02-08 03:55:08'),(196,2,54,NULL,'utilities.js','javascript',NULL,NULL,NULL,3205,NULL,1,1,'2023-02-07 16:51:48','2023-02-08 03:55:08','2023-02-08 03:55:08'),(197,2,56,NULL,'CraftSupportWidget.js','javascript',NULL,NULL,NULL,14020,NULL,1,1,'2023-02-07 16:51:39','2023-02-08 03:55:08','2023-02-08 03:55:08'),(198,2,57,NULL,'craft-partners.svg','image',NULL,219,36,3309,NULL,1,1,'2023-02-07 16:51:39','2023-02-08 03:55:08','2023-02-08 03:55:08'),(199,2,57,NULL,'craftquest.svg','image',NULL,594,172,3065,NULL,1,1,'2023-02-07 16:51:39','2023-02-08 03:55:08','2023-02-08 03:55:08'),(200,2,57,NULL,'discord.svg','image',NULL,725,198,2844,NULL,1,1,'2023-02-07 16:51:39','2023-02-08 03:55:08','2023-02-08 03:55:08'),(201,3,59,1,'do-research.jpeg','image',NULL,800,793,64310,NULL,0,0,'2023-02-08 06:12:08','2023-02-08 06:12:09','2023-02-08 06:12:09'),(202,3,61,NULL,'Dashboard.js','javascript',NULL,NULL,NULL,16933,NULL,1,1,'2023-02-07 16:51:39','2023-02-08 06:23:29','2023-02-08 06:23:29'),(203,3,63,NULL,'xregexp-all.js.LICENSE.txt','text',NULL,NULL,NULL,1074,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:29','2023-02-08 06:23:29'),(204,3,63,NULL,'xregexp-all.js','javascript',NULL,NULL,NULL,93888,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:29','2023-02-08 06:23:29'),(205,3,64,NULL,'htmx.min.js','javascript',NULL,NULL,NULL,50182,NULL,1,1,'2023-02-08 03:28:27','2023-02-08 06:23:29','2023-02-08 06:23:29'),(206,3,67,NULL,'ar-OM.json','json',NULL,NULL,NULL,137,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:29','2023-02-08 06:23:29'),(207,3,67,NULL,'uk-UA.json','json',NULL,NULL,NULL,72,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:29','2023-02-08 06:23:29'),(208,3,67,NULL,'ar-QA.json','json',NULL,NULL,NULL,137,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:29','2023-02-08 06:23:29'),(209,3,67,NULL,'es-BO.json','json',NULL,NULL,NULL,86,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:29','2023-02-08 06:23:29'),(210,3,67,NULL,'en-US.json','json',NULL,NULL,NULL,66,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:29','2023-02-08 06:23:29'),(211,3,67,NULL,'ru-RU.json','json',NULL,NULL,NULL,75,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:29','2023-02-08 06:23:29'),(212,3,67,NULL,'ar-YE.json','json',NULL,NULL,NULL,137,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:29','2023-02-08 06:23:29'),(213,3,67,NULL,'ar-PS.json','json',NULL,NULL,NULL,134,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:29','2023-02-08 06:23:29'),(214,3,67,NULL,'pt-BR.json','json',NULL,NULL,NULL,67,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:29','2023-02-08 06:23:29'),(215,3,67,NULL,'ar-KW.json','json',NULL,NULL,NULL,137,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:29','2023-02-08 06:23:29'),(216,3,67,NULL,'pl-PL.json','json',NULL,NULL,NULL,68,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:29','2023-02-08 06:23:29'),(217,3,67,NULL,'ar-SD.json','json',NULL,NULL,NULL,137,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:29','2023-02-08 06:23:29'),(218,3,67,NULL,'ar-001.json','json',NULL,NULL,NULL,130,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:29','2023-02-08 06:23:29'),(219,3,67,NULL,'ar-MR.json','json',NULL,NULL,NULL,137,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:30','2023-02-08 06:23:30'),(220,3,67,NULL,'hu-HU.json','json',NULL,NULL,NULL,70,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:30','2023-02-08 06:23:30'),(221,3,67,NULL,'en-GB.json','json',NULL,NULL,NULL,67,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:30','2023-02-08 06:23:30'),(222,3,67,NULL,'en-CA.json','json',NULL,NULL,NULL,66,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:30','2023-02-08 06:23:30'),(223,3,67,NULL,'ar-ER.json','json',NULL,NULL,NULL,134,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:30','2023-02-08 06:23:30'),(224,3,67,NULL,'nl-NL.json','json',NULL,NULL,NULL,70,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:30','2023-02-08 06:23:30'),(225,3,67,NULL,'es-MX.json','json',NULL,NULL,NULL,66,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:30','2023-02-08 06:23:30'),(226,3,67,NULL,'sv-SE.json','json',NULL,NULL,NULL,69,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:30','2023-02-08 06:23:30'),(227,3,67,NULL,'ar-LB.json','json',NULL,NULL,NULL,137,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:30','2023-02-08 06:23:30'),(228,3,67,NULL,'ar-JO.json','json',NULL,NULL,NULL,137,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:30','2023-02-08 06:23:30'),(229,3,67,NULL,'fi-FI.json','json',NULL,NULL,NULL,71,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:30','2023-02-08 06:23:30'),(230,3,67,NULL,'zh-CN.json','json',NULL,NULL,NULL,67,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:30','2023-02-08 06:23:30'),(231,3,67,NULL,'ja-JP.json','json',NULL,NULL,NULL,68,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:30','2023-02-08 06:23:30'),(232,3,67,NULL,'ar-SO.json','json',NULL,NULL,NULL,135,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:30','2023-02-08 06:23:30'),(233,3,67,NULL,'en-IN.json','json',NULL,NULL,NULL,86,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:30','2023-02-08 06:23:30'),(234,3,67,NULL,'es-ES.json','json',NULL,NULL,NULL,70,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:30','2023-02-08 06:23:30'),(235,3,67,NULL,'ar-TN.json','json',NULL,NULL,NULL,72,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:30','2023-02-08 06:23:30'),(236,3,67,NULL,'fr-FR.json','json',NULL,NULL,NULL,88,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:30','2023-02-08 06:23:30'),(237,3,67,NULL,'he-IL.json','json',NULL,NULL,NULL,68,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:30','2023-02-08 06:23:30'),(238,3,67,NULL,'ar-EG.json','json',NULL,NULL,NULL,137,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:30','2023-02-08 06:23:30'),(239,3,67,NULL,'en-IE.json','json',NULL,NULL,NULL,68,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:30','2023-02-08 06:23:30'),(240,3,67,NULL,'mk-MK.json','json',NULL,NULL,NULL,74,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:30','2023-02-08 06:23:30'),(241,3,67,NULL,'ar-LY.json','json',NULL,NULL,NULL,72,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:30','2023-02-08 06:23:30'),(242,3,67,NULL,'ar-IQ.json','json',NULL,NULL,NULL,137,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:30','2023-02-08 06:23:30'),(243,3,67,NULL,'ar-MA.json','json',NULL,NULL,NULL,72,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:30','2023-02-08 06:23:30'),(244,3,67,NULL,'cs-CZ.json','json',NULL,NULL,NULL,71,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:30','2023-02-08 06:23:30'),(245,3,67,NULL,'de-DE.json','json',NULL,NULL,NULL,70,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:30','2023-02-08 06:23:30'),(246,3,67,NULL,'ar-SA.json','json',NULL,NULL,NULL,137,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:30','2023-02-08 06:23:30'),(247,3,67,NULL,'fr-CA.json','json',NULL,NULL,NULL,67,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:31','2023-02-08 06:23:31'),(248,3,67,NULL,'ar-DZ.json','json',NULL,NULL,NULL,72,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:31','2023-02-08 06:23:31'),(249,3,67,NULL,'ar-SY.json','json',NULL,NULL,NULL,137,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:31','2023-02-08 06:23:31'),(250,3,67,NULL,'ar-EH.json','json',NULL,NULL,NULL,72,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:31','2023-02-08 06:23:31'),(251,3,67,NULL,'ko-KR.json','json',NULL,NULL,NULL,68,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:31','2023-02-08 06:23:31'),(252,3,67,NULL,'de-CH.json','json',NULL,NULL,NULL,70,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:31','2023-02-08 06:23:31'),(253,3,67,NULL,'ar-BH.json','json',NULL,NULL,NULL,137,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:31','2023-02-08 06:23:31'),(254,3,67,NULL,'it-IT.json','json',NULL,NULL,NULL,68,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:31','2023-02-08 06:23:31'),(255,3,67,NULL,'ar-SS.json','json',NULL,NULL,NULL,133,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:31','2023-02-08 06:23:31'),(256,3,67,NULL,'ar-DJ.json','json',NULL,NULL,NULL,137,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:31','2023-02-08 06:23:31'),(257,3,67,NULL,'ar-IL.json','json',NULL,NULL,NULL,134,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:31','2023-02-08 06:23:31'),(258,3,67,NULL,'ar-AE.json','json',NULL,NULL,NULL,137,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:31','2023-02-08 06:23:31'),(259,3,67,NULL,'ar-TD.json','json',NULL,NULL,NULL,138,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:31','2023-02-08 06:23:31'),(260,3,67,NULL,'ar-KM.json','json',NULL,NULL,NULL,140,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:31','2023-02-08 06:23:31'),(261,3,67,NULL,'ca-ES.json','json',NULL,NULL,NULL,70,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:31','2023-02-08 06:23:31'),(262,3,69,NULL,'uk-UA.json','json',NULL,NULL,NULL,633,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:31','2023-02-08 06:23:31'),(263,3,69,NULL,'en-US.json','json',NULL,NULL,NULL,430,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:31','2023-02-08 06:23:31'),(264,3,69,NULL,'ru-RU.json','json',NULL,NULL,NULL,606,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:31','2023-02-08 06:23:31'),(265,3,69,NULL,'pt-BR.json','json',NULL,NULL,NULL,439,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:31','2023-02-08 06:23:31'),(266,3,69,NULL,'pl-PL.json','json',NULL,NULL,NULL,491,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:31','2023-02-08 06:23:31'),(267,3,69,NULL,'hu-HU.json','json',NULL,NULL,NULL,473,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:31','2023-02-08 06:23:31'),(268,3,69,NULL,'en-GB.json','json',NULL,NULL,NULL,432,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:31','2023-02-08 06:23:31'),(269,3,69,NULL,'en-CA.json','json',NULL,NULL,NULL,432,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:31','2023-02-08 06:23:31'),(270,3,69,NULL,'nl-NL.json','json',NULL,NULL,NULL,429,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:31','2023-02-08 06:23:31'),(271,3,69,NULL,'es-MX.json','json',NULL,NULL,NULL,431,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:31','2023-02-08 06:23:31'),(272,3,69,NULL,'sv-SE.json','json',NULL,NULL,NULL,435,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:31','2023-02-08 06:23:31'),(273,3,69,NULL,'tr-TR.json','json',NULL,NULL,NULL,431,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:31','2023-02-08 06:23:31'),(274,3,69,NULL,'fi-FI.json','json',NULL,NULL,NULL,494,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:32','2023-02-08 06:23:32'),(275,3,69,NULL,'zh-CN.json','json',NULL,NULL,NULL,523,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:32','2023-02-08 06:23:32'),(276,3,69,NULL,'ja-JP.json','json',NULL,NULL,NULL,431,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:32','2023-02-08 06:23:32'),(277,3,69,NULL,'fa-IR.json','json',NULL,NULL,NULL,655,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:32','2023-02-08 06:23:32'),(278,3,69,NULL,'es-ES.json','json',NULL,NULL,NULL,443,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:32','2023-02-08 06:23:32'),(279,3,69,NULL,'fr-FR.json','json',NULL,NULL,NULL,457,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:32','2023-02-08 06:23:32'),(280,3,69,NULL,'he-IL.json','json',NULL,NULL,NULL,554,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:32','2023-02-08 06:23:32'),(281,3,69,NULL,'ar-EG.json','json',NULL,NULL,NULL,653,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:32','2023-02-08 06:23:32'),(282,3,69,NULL,'mk-MK.json','json',NULL,NULL,NULL,610,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:32','2023-02-08 06:23:32'),(283,3,69,NULL,'cs-CZ.json','json',NULL,NULL,NULL,456,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:32','2023-02-08 06:23:32'),(284,3,69,NULL,'de-DE.json','json',NULL,NULL,NULL,433,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:32','2023-02-08 06:23:32'),(285,3,69,NULL,'fr-CA.json','json',NULL,NULL,NULL,428,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:32','2023-02-08 06:23:32'),(286,3,69,NULL,'ko-KR.json','json',NULL,NULL,NULL,445,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:32','2023-02-08 06:23:32'),(287,3,69,NULL,'de-CH.json','json',NULL,NULL,NULL,433,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:32','2023-02-08 06:23:32'),(288,3,69,NULL,'da-DK.json','json',NULL,NULL,NULL,432,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:32','2023-02-08 06:23:32'),(289,3,69,NULL,'it-IT.json','json',NULL,NULL,NULL,446,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:32','2023-02-08 06:23:32'),(290,3,69,NULL,'zh-TW.json','json',NULL,NULL,NULL,475,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:32','2023-02-08 06:23:32'),(291,3,69,NULL,'nb-NO.json','json',NULL,NULL,NULL,435,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:32','2023-02-08 06:23:32'),(292,3,69,NULL,'ca-ES.json','json',NULL,NULL,NULL,453,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:32','2023-02-08 06:23:32'),(293,3,65,NULL,'d3.js','javascript',NULL,NULL,NULL,222515,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:32','2023-02-08 06:23:32'),(294,3,70,NULL,'AssetIndexer.js','javascript',NULL,NULL,NULL,9950,NULL,1,1,'2023-02-08 03:54:55','2023-02-08 06:23:32','2023-02-08 06:23:32'),(295,3,71,NULL,'jquery-ui.js','javascript',NULL,NULL,NULL,56131,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:32','2023-02-08 06:23:32'),(296,3,71,NULL,'jquery-ui.js.LICENSE.txt','text',NULL,NULL,NULL,1315,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:32','2023-02-08 06:23:32'),(297,3,72,NULL,'tailwind_reset.js','javascript',NULL,NULL,NULL,3210,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:32','2023-02-08 06:23:32'),(298,3,74,NULL,'element-resize-detector.js','javascript',NULL,NULL,NULL,19189,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:33','2023-02-08 06:23:33'),(299,3,74,NULL,'element-resize-detector.js.LICENSE.txt','text',NULL,NULL,NULL,148,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:33','2023-02-08 06:23:33'),(300,3,75,NULL,'jquery.fileupload.js','javascript',NULL,NULL,NULL,18905,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:33','2023-02-08 06:23:33'),(301,3,76,NULL,'garnish.js','javascript',NULL,NULL,NULL,102763,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:33','2023-02-08 06:23:33'),(302,3,76,NULL,'garnish.js.LICENSE.txt','text',NULL,NULL,NULL,126,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:33','2023-02-08 06:23:33'),(303,3,77,NULL,'picturefill.js.LICENSE.txt','text',NULL,NULL,NULL,613,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:33','2023-02-08 06:23:33'),(304,3,77,NULL,'picturefill.js','javascript',NULL,NULL,NULL,11502,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:33','2023-02-08 06:23:33'),(305,3,78,NULL,'selectize.js','javascript',NULL,NULL,NULL,48302,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:33','2023-02-08 06:23:33'),(306,3,80,NULL,'jquery.payment.js','javascript',NULL,NULL,NULL,8412,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:33','2023-02-08 06:23:33'),(307,3,81,NULL,'login.js','javascript',NULL,NULL,NULL,6937,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:33','2023-02-08 06:23:33'),(308,3,83,NULL,'ConditionBuilder.js','javascript',NULL,NULL,NULL,330,NULL,1,1,'2023-02-08 03:28:27','2023-02-08 06:23:33','2023-02-08 06:23:33'),(309,3,84,NULL,'velocity.js','javascript',NULL,NULL,NULL,44583,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:33','2023-02-08 06:23:33'),(310,3,84,NULL,'velocity.js.LICENSE.txt','text',NULL,NULL,NULL,229,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:33','2023-02-08 06:23:33'),(311,3,85,NULL,'RecentEntriesWidget.js','javascript',NULL,NULL,NULL,1433,NULL,1,1,'2023-02-07 16:51:39','2023-02-08 06:23:34','2023-02-08 06:23:34'),(312,3,86,NULL,'fabric.js','javascript',NULL,NULL,NULL,261693,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:34','2023-02-08 06:23:34'),(313,3,86,NULL,'fabric.js.LICENSE.txt','text',NULL,NULL,NULL,78,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:34','2023-02-08 06:23:34'),(314,3,87,NULL,'manifest.json','json',NULL,NULL,NULL,78,NULL,1,1,'2023-02-08 03:28:25','2023-02-08 06:23:34','2023-02-08 06:23:34'),(315,3,88,NULL,'app.js','javascript',NULL,NULL,NULL,161702,NULL,1,1,'2023-02-08 03:28:25','2023-02-08 06:23:34','2023-02-08 06:23:34'),(316,3,88,NULL,'app.js.LICENSE.txt','text',NULL,NULL,NULL,462,NULL,1,1,'2023-02-08 03:28:25','2023-02-08 06:23:34','2023-02-08 06:23:34'),(317,3,91,NULL,'resizehandle_rtl_2x.png','image',NULL,26,26,343,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:34','2023-02-08 06:23:34'),(318,3,91,NULL,'resizehandle_rtl.png','image',NULL,14,14,212,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:34','2023-02-08 06:23:34'),(319,3,92,NULL,'chrome-tablet-bottom.svg','image',NULL,768,55,680,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:34','2023-02-08 06:23:34'),(320,3,92,NULL,'icon-phone.svg','image',NULL,13,28,680,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:34','2023-02-08 06:23:34'),(321,3,92,NULL,'icon-desktop.svg','image',NULL,34,28,927,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:34','2023-02-08 06:23:34'),(322,3,92,NULL,'chrome-phone-bottom.svg','image',NULL,375,55,680,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:34','2023-02-08 06:23:34'),(323,3,92,NULL,'icon-tablet.svg','image',NULL,19,28,694,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:34','2023-02-08 06:23:34'),(324,3,92,NULL,'chrome-tablet-top.svg','image',NULL,768,31,666,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:34','2023-02-08 06:23:34'),(325,3,92,NULL,'chrome-phone-top.svg','image',NULL,375,31,784,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:34','2023-02-08 06:23:34'),(326,3,91,NULL,'hudtip_right.png','image',NULL,15,30,1146,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:34','2023-02-08 06:23:34'),(327,3,91,NULL,'user.svg','image',NULL,1000,1000,1626,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:34','2023-02-08 06:23:34'),(328,3,91,NULL,'welcome_logo_2x.png','image',NULL,416,332,7091,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:34','2023-02-08 06:23:34'),(329,3,91,NULL,'temp_folder.png','image',NULL,96,78,10923,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:34','2023-02-08 06:23:34'),(330,3,91,NULL,'craft.png','image',NULL,202,106,3314,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:34','2023-02-08 06:23:34'),(331,3,91,NULL,'hudtip_bottom.png','image',NULL,30,15,1134,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:34','2023-02-08 06:23:34'),(332,3,91,NULL,'hudtip_bottom_gray_2x.png','image',NULL,60,30,1330,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:35','2023-02-08 06:23:35'),(333,3,91,NULL,'listview_sort_2x.png','image',NULL,52,124,1420,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:35','2023-02-08 06:23:35'),(334,3,91,NULL,'welcome_logo.png','image',NULL,208,166,5319,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:35','2023-02-08 06:23:35'),(335,3,91,NULL,'resizehandle_2x.png','image',NULL,26,26,318,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:35','2023-02-08 06:23:35'),(336,3,91,NULL,'hudtip_top_2x.png','image',NULL,60,30,1236,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:35','2023-02-08 06:23:35'),(337,3,91,NULL,'hudtip_top.png','image',NULL,30,15,1112,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:35','2023-02-08 06:23:35'),(338,3,91,NULL,'resizehandle.png','image',NULL,14,14,227,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:35','2023-02-08 06:23:35'),(339,3,93,NULL,'safari-pinned-tab.svg','image',NULL,700,700,1445,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:35','2023-02-08 06:23:35'),(340,3,93,NULL,'icon.svg','image',NULL,100,100,846,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:35','2023-02-08 06:23:35'),(341,3,93,NULL,'apple-touch-icon.png','image',NULL,180,180,3805,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:35','2023-02-08 06:23:35'),(342,3,91,NULL,'success.png','image',NULL,48,48,1150,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:35','2023-02-08 06:23:35'),(343,3,94,NULL,'filters.svg','image',NULL,24,24,833,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:35','2023-02-08 06:23:35'),(344,3,94,NULL,'orientation-landscape-unchecked.svg','image',NULL,32,22,753,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:35','2023-02-08 06:23:35'),(345,3,94,NULL,'flip-horizontal.svg','image',NULL,24,24,1157,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:35','2023-02-08 06:23:35'),(346,3,94,NULL,'check.svg','image',NULL,15,11,983,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:35','2023-02-08 06:23:35'),(347,3,94,NULL,'flip-vertical.svg','image',NULL,24,24,1245,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:35','2023-02-08 06:23:35'),(348,3,94,NULL,'orientation-landscape-checked.svg','image',NULL,32,22,1318,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:35','2023-02-08 06:23:35'),(349,3,94,NULL,'focal-point.svg','image',NULL,24,24,1090,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:35','2023-02-08 06:23:35'),(350,3,94,NULL,'crop.svg','image',NULL,24,24,828,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:35','2023-02-08 06:23:35'),(351,3,94,NULL,'unconstrained.svg','image',NULL,24,24,898,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:35','2023-02-08 06:23:35'),(352,3,94,NULL,'rotate-left.svg','image',NULL,24,24,1020,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:35','2023-02-08 06:23:35'),(353,3,94,NULL,'orientation-portrait-unchecked.svg','image',NULL,22,32,651,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:35','2023-02-08 06:23:35'),(354,3,94,NULL,'rotate-right.svg','image',NULL,24,24,1101,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:35','2023-02-08 06:23:35'),(355,3,94,NULL,'orientation-portrait-checked.svg','image',NULL,22,32,1218,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:35','2023-02-08 06:23:35'),(356,3,91,NULL,'prg.jpg','image',NULL,500,308,43114,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:35','2023-02-08 06:23:35'),(357,3,91,NULL,'hudtip_left.png','image',NULL,15,30,1120,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:35','2023-02-08 06:23:35'),(358,3,91,NULL,'success_2x.png','image',NULL,96,96,2352,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:36','2023-02-08 06:23:36'),(359,3,91,NULL,'hudtip_bottom_2x.png','image',NULL,60,30,1310,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:36','2023-02-08 06:23:36'),(360,3,91,NULL,'craftcms.svg','image',NULL,104,26,5747,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:36','2023-02-08 06:23:36'),(361,3,91,NULL,'hudtip_left_2x.png','image',NULL,30,60,1333,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:36','2023-02-08 06:23:36'),(362,3,91,NULL,'dev-mode.svg','image',NULL,40,5,751,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:36','2023-02-08 06:23:36'),(363,3,91,NULL,'branch_rtl.png','image',NULL,40,15,1415,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:36','2023-02-08 06:23:36'),(364,3,91,NULL,'craft_2x.png','image',NULL,404,212,7302,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:36','2023-02-08 06:23:36'),(365,3,91,NULL,'listview_sort.png','image',NULL,26,62,1200,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:36','2023-02-08 06:23:36'),(366,3,91,NULL,'branch_rtl_2x.png','image',NULL,80,30,1465,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:36','2023-02-08 06:23:36'),(367,3,91,NULL,'hudtip_right_2x.png','image',NULL,30,60,1330,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:36','2023-02-08 06:23:36'),(368,3,91,NULL,'branch.png','image',NULL,40,15,1418,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:36','2023-02-08 06:23:36'),(369,3,91,NULL,'hudtip_bottom_gray.png','image',NULL,30,15,1183,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:36','2023-02-08 06:23:36'),(370,3,91,NULL,'branch_2x.png','image',NULL,80,30,1468,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:36','2023-02-08 06:23:36'),(371,3,90,NULL,'cp.js','javascript',NULL,NULL,NULL,520341,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:36','2023-02-08 06:23:36'),(372,3,95,NULL,'Craft.svg','image',NULL,100,100,169386,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:36','2023-02-08 06:23:36'),(373,3,97,NULL,'FeedWidget.js','javascript',NULL,NULL,NULL,933,NULL,1,1,'2023-02-07 16:51:39','2023-02-08 06:23:36','2023-02-08 06:23:36'),(374,3,98,NULL,'UpdatesWidget.js','javascript',NULL,NULL,NULL,1431,NULL,1,1,'2023-02-07 16:51:39','2023-02-08 06:23:36','2023-02-08 06:23:36'),(375,3,99,NULL,'axios.js.LICENSE.txt','text',NULL,NULL,NULL,4944,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:37','2023-02-08 06:23:37'),(376,3,99,NULL,'axios.js','javascript',NULL,NULL,NULL,23120,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:37','2023-02-08 06:23:37'),(377,3,100,NULL,'jquery.mobile-events.js','javascript',NULL,NULL,NULL,15783,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:37','2023-02-08 06:23:37'),(378,3,100,NULL,'jquery.mobile-events.js.LICENSE.txt','text',NULL,NULL,NULL,1200,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:37','2023-02-08 06:23:37'),(379,3,101,NULL,'iframeResizer.contentWindow.js','javascript',NULL,NULL,NULL,13313,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:37','2023-02-08 06:23:37'),(380,3,101,NULL,'iframeResizer.js','javascript',NULL,NULL,NULL,13762,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:37','2023-02-08 06:23:37'),(381,3,103,NULL,'db.png','image',NULL,736,953,52504,NULL,1,1,'2023-02-07 16:51:29','2023-02-08 06:23:37','2023-02-08 06:23:37'),(382,3,103,NULL,'account.png','image',NULL,736,953,49350,NULL,1,1,'2023-02-07 16:51:29','2023-02-08 06:23:37','2023-02-08 06:23:37'),(383,3,103,NULL,'site.png','image',NULL,736,953,62301,NULL,1,1,'2023-02-07 16:51:29','2023-02-08 06:23:37','2023-02-08 06:23:37'),(384,3,103,NULL,'installer-bg.png','image',NULL,3000,1690,234891,NULL,1,1,'2023-02-07 16:51:29','2023-02-08 06:23:37','2023-02-08 06:23:37'),(385,3,102,NULL,'install.js','javascript',NULL,NULL,NULL,7203,NULL,1,1,'2023-02-07 16:51:29','2023-02-08 06:23:37','2023-02-08 06:23:37'),(386,3,105,NULL,'prism.js','javascript',NULL,NULL,NULL,17569,NULL,1,1,'2023-02-08 03:29:10','2023-02-08 06:23:37','2023-02-08 06:23:37'),(387,3,106,NULL,'jquery.js.LICENSE.txt','text',NULL,NULL,NULL,475,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:37','2023-02-08 06:23:37'),(388,3,106,NULL,'jquery.js','javascript',NULL,NULL,NULL,90123,NULL,1,1,'2023-02-07 16:51:33','2023-02-08 06:23:37','2023-02-08 06:23:37'),(389,3,107,NULL,'vue.js','javascript',NULL,NULL,NULL,161014,NULL,1,1,'2023-02-08 03:28:25','2023-02-08 06:23:38','2023-02-08 06:23:38'),(390,3,107,NULL,'vue.js.LICENSE.txt','text',NULL,NULL,NULL,158,NULL,1,1,'2023-02-08 03:28:25','2023-02-08 06:23:38','2023-02-08 06:23:38'),(391,3,108,NULL,'manifest.json','json',NULL,NULL,NULL,87,NULL,1,1,'2023-02-08 03:54:02','2023-02-08 06:23:38','2023-02-08 06:23:38'),(392,3,108,NULL,'queue-manager.js','javascript',NULL,NULL,NULL,4639,NULL,1,1,'2023-02-08 03:54:02','2023-02-08 06:23:38','2023-02-08 06:23:38'),(393,3,108,NULL,'queue-manager.js.LICENSE.txt','text',NULL,NULL,NULL,135,NULL,1,1,'2023-02-08 03:54:02','2023-02-08 06:23:38','2023-02-08 06:23:38'),(394,3,109,NULL,'utilities.js','javascript',NULL,NULL,NULL,3205,NULL,1,1,'2023-02-07 16:51:48','2023-02-08 06:23:38','2023-02-08 06:23:38'),(395,3,111,NULL,'CraftSupportWidget.js','javascript',NULL,NULL,NULL,14020,NULL,1,1,'2023-02-07 16:51:39','2023-02-08 06:23:38','2023-02-08 06:23:38'),(396,3,112,NULL,'craft-partners.svg','image',NULL,219,36,3309,NULL,1,1,'2023-02-07 16:51:39','2023-02-08 06:23:38','2023-02-08 06:23:38'),(397,3,112,NULL,'craftquest.svg','image',NULL,594,172,3065,NULL,1,1,'2023-02-07 16:51:39','2023-02-08 06:23:38','2023-02-08 06:23:38'),(398,3,112,NULL,'discord.svg','image',NULL,725,198,2844,NULL,1,1,'2023-02-07 16:51:39','2023-02-08 06:23:38','2023-02-08 06:23:38'),(399,3,59,1,'rami.jpeg','image',NULL,1154,1490,197909,NULL,0,0,'2023-02-08 06:24:50','2023-02-08 06:24:50','2023-02-08 06:24:50'),(400,3,59,1,'do-research.jpeg','image',NULL,800,793,66565,NULL,1,1,'2023-02-08 06:29:24','2023-02-08 06:29:24','2023-02-08 06:29:24'),(401,3,59,1,'rami.jpeg','image',NULL,1154,1490,193726,NULL,1,1,'2023-02-08 06:31:39','2023-02-08 06:31:39','2023-02-08 06:31:39');
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `content` VALUES (1,1,1,NULL,'2023-02-02 05:28:23','2023-02-02 05:28:23','e5f6e318-4d9f-4ce0-9c87-be98e1bd6559'),(2,2,1,'Rami','2023-02-08 03:29:22','2023-02-08 03:29:22','39776e25-715a-496e-9a11-e155b4b8ab61'),(3,3,1,'Rami','2023-02-08 03:43:59','2023-02-08 03:55:08','c6dbb149-3f19-44c9-a636-27ea8fefb9b7'),(4,4,1,'Dashboard','2023-02-08 03:54:58','2023-02-08 03:54:58','6ace2919-b4f7-4f6c-87ed-588e13e44349'),(5,5,1,'Xregexp all js LICENSE','2023-02-08 03:54:58','2023-02-08 03:54:58','f9667bce-aa7e-4eab-9fda-bb10a4c0346f'),(6,6,1,'Xregexp all','2023-02-08 03:54:58','2023-02-08 03:54:58','7ec5f29d-5c48-4560-95d7-2a792525fc9b'),(7,7,1,'Htmx min','2023-02-08 03:54:58','2023-02-08 03:54:58','19a8f41f-0324-49b6-bfac-24a15fdb0be0'),(8,8,1,'Ar OM','2023-02-08 03:54:58','2023-02-08 03:54:58','45b2eb5d-96ff-45ae-a177-094bfa4e717f'),(9,9,1,'Uk UA','2023-02-08 03:54:58','2023-02-08 03:54:58','c261e305-81b0-4386-b942-22fabab41fbc'),(10,10,1,'Ar QA','2023-02-08 03:54:58','2023-02-08 03:54:58','e0cb50c2-7bf9-4a5c-99ee-198e7dfe0a46'),(11,11,1,'Es BO','2023-02-08 03:54:59','2023-02-08 03:54:59','c1e79888-a613-44af-bb1f-9eb1a1224af7'),(12,12,1,'En US','2023-02-08 03:54:59','2023-02-08 03:54:59','2ea4ca4a-d49c-4aae-9d5f-fd28f104d854'),(13,13,1,'Ru RU','2023-02-08 03:54:59','2023-02-08 03:54:59','b08bc52e-5dab-4c6e-b0a6-01fe7e8c8e0b'),(14,14,1,'Ar YE','2023-02-08 03:54:59','2023-02-08 03:54:59','7abdbe19-7eed-43df-aceb-69a99ece260e'),(15,15,1,'Ar PS','2023-02-08 03:54:59','2023-02-08 03:54:59','031d09d7-c1c4-42a6-abb8-480878685772'),(16,16,1,'Pt BR','2023-02-08 03:54:59','2023-02-08 03:54:59','4d755ca8-5c15-4796-9ba3-9ac720f92350'),(17,17,1,'Ar KW','2023-02-08 03:54:59','2023-02-08 03:54:59','67602cf2-fbef-4ac9-b0e4-b3ce4f2fce1a'),(18,18,1,'Pl PL','2023-02-08 03:54:59','2023-02-08 03:54:59','d99f7352-f356-48ab-ad66-986eee963ae4'),(19,19,1,'Ar SD','2023-02-08 03:54:59','2023-02-08 03:54:59','f9f94a20-cc07-4016-b2fd-558e37762cd4'),(20,20,1,'Ar 001','2023-02-08 03:54:59','2023-02-08 03:54:59','683b1e2c-da7d-4578-9f58-0ceee117587f'),(21,21,1,'Ar MR','2023-02-08 03:54:59','2023-02-08 03:54:59','3d84a5ac-db70-4873-af30-fd4aab2d2f36'),(22,22,1,'Hu HU','2023-02-08 03:54:59','2023-02-08 03:54:59','87885542-4a65-4ef3-a1e4-1ef516be52c7'),(23,23,1,'En GB','2023-02-08 03:54:59','2023-02-08 03:54:59','3ed3d426-ab9b-4599-a5a5-2f04c40b4bd8'),(24,24,1,'En CA','2023-02-08 03:54:59','2023-02-08 03:54:59','10d3cd1b-73ef-4f85-b207-e646a9ea18e6'),(25,25,1,'Ar ER','2023-02-08 03:54:59','2023-02-08 03:54:59','1351edca-70b5-44a6-afa3-f18f8ee49e76'),(26,26,1,'Nl NL','2023-02-08 03:54:59','2023-02-08 03:54:59','b7789f32-83e4-4cc7-b264-4ec720dc7cac'),(27,27,1,'Es MX','2023-02-08 03:54:59','2023-02-08 03:54:59','6d579bb0-feca-4ebb-8a17-3b4dc1b7f640'),(28,28,1,'Sv SE','2023-02-08 03:54:59','2023-02-08 03:54:59','21764e82-8be2-48ec-af53-635c9df71d89'),(29,29,1,'Ar LB','2023-02-08 03:54:59','2023-02-08 03:54:59','ec24ef36-b36e-4e1e-9aa3-62d99232078e'),(30,30,1,'Ar JO','2023-02-08 03:54:59','2023-02-08 03:54:59','e16070a1-82ba-44ae-b1e5-2234a83688ea'),(31,31,1,'Fi FI','2023-02-08 03:54:59','2023-02-08 03:54:59','1ac8cbb6-8efc-4ee7-af8b-ba59e733e032'),(32,32,1,'Zh CN','2023-02-08 03:54:59','2023-02-08 03:54:59','8c124732-d93e-4a2d-af88-affb105c7001'),(33,33,1,'Ja JP','2023-02-08 03:54:59','2023-02-08 03:54:59','cc0c724b-2485-4cc9-ae6f-716b23e7d800'),(34,34,1,'Ar SO','2023-02-08 03:54:59','2023-02-08 03:54:59','0611aba2-d27d-4143-87af-78510fa5cf49'),(35,35,1,'En IN','2023-02-08 03:54:59','2023-02-08 03:54:59','f4813f79-b4c0-4c15-b0d9-fc880add7fae'),(36,36,1,'Es ES','2023-02-08 03:55:00','2023-02-08 03:55:00','f3783ab4-c719-4d33-9cfd-c871b2fa78cd'),(37,37,1,'Ar TN','2023-02-08 03:55:00','2023-02-08 03:55:00','f36e3b6b-6ac4-43a0-94c5-41d468688a9f'),(38,38,1,'Fr FR','2023-02-08 03:55:00','2023-02-08 03:55:00','792ba5d6-4bc6-4f9b-b3f2-d15547c44949'),(39,39,1,'He IL','2023-02-08 03:55:00','2023-02-08 03:55:00','b250a49e-b366-4a29-8cf8-ce0c6baa9d26'),(40,40,1,'Ar EG','2023-02-08 03:55:00','2023-02-08 03:55:00','57391c55-d6f9-4cf7-a076-3c5ad961fa38'),(41,41,1,'En IE','2023-02-08 03:55:00','2023-02-08 03:55:00','ed0bf6d0-d63a-48f5-8dbf-9e42650f67ba'),(42,42,1,'Mk MK','2023-02-08 03:55:00','2023-02-08 03:55:00','d5173c68-9de2-42f7-b0c2-90122092b278'),(43,43,1,'Ar LY','2023-02-08 03:55:00','2023-02-08 03:55:00','2dce539f-83cf-4be4-a92c-6c5e6f9f9de0'),(44,44,1,'Ar IQ','2023-02-08 03:55:00','2023-02-08 03:55:00','38e83326-1b5f-43f5-b622-ea20a7223eaa'),(45,45,1,'Ar MA','2023-02-08 03:55:00','2023-02-08 03:55:00','348184a8-0625-4842-8011-9618bf82a81a'),(46,46,1,'Cs CZ','2023-02-08 03:55:00','2023-02-08 03:55:00','ab131e6d-06af-49a7-8c15-51e06b4cb8c1'),(47,47,1,'De DE','2023-02-08 03:55:00','2023-02-08 03:55:00','8bd54cdc-d09d-48e1-93e7-55f42f5dd2a6'),(48,48,1,'Ar SA','2023-02-08 03:55:00','2023-02-08 03:55:00','18fc9451-968f-4e4e-9b54-f83871649864'),(49,49,1,'Fr CA','2023-02-08 03:55:00','2023-02-08 03:55:00','128a2066-bd13-484d-b38e-958339d0afd2'),(50,50,1,'Ar DZ','2023-02-08 03:55:00','2023-02-08 03:55:00','44389472-eb3e-4e70-a29a-a6a691b28f4f'),(51,51,1,'Ar SY','2023-02-08 03:55:00','2023-02-08 03:55:00','c20cf13b-9bf3-4e47-8ab2-1714e312e576'),(52,52,1,'Ar EH','2023-02-08 03:55:00','2023-02-08 03:55:00','a9f4f85c-eb01-4cce-83c8-1c409fb39a03'),(53,53,1,'Ko KR','2023-02-08 03:55:00','2023-02-08 03:55:00','9d23afa6-0a6f-491f-bca2-3e93c507ab65'),(54,54,1,'De CH','2023-02-08 03:55:00','2023-02-08 03:55:00','a80d6c7f-8226-4604-a6cc-75d126b17923'),(55,55,1,'Ar BH','2023-02-08 03:55:00','2023-02-08 03:55:00','4f8c15de-872c-4b50-867a-50908f3b48c4'),(56,56,1,'It IT','2023-02-08 03:55:00','2023-02-08 03:55:00','34275ed1-2745-4a31-8b4f-12f6f85acdc9'),(57,57,1,'Ar SS','2023-02-08 03:55:00','2023-02-08 03:55:00','a3ed43b7-1cac-4764-920d-e60956422390'),(58,58,1,'Ar DJ','2023-02-08 03:55:00','2023-02-08 03:55:00','ea78d92a-d59f-4aea-85b2-e4ad1ee31849'),(59,59,1,'Ar IL','2023-02-08 03:55:00','2023-02-08 03:55:00','6e788ca7-4522-4f20-b782-b1955a884891'),(60,60,1,'Ar AE','2023-02-08 03:55:00','2023-02-08 03:55:00','ad7bec63-54f4-481b-b5e9-06426ba99e01'),(61,61,1,'Ar TD','2023-02-08 03:55:00','2023-02-08 03:55:00','c3077fce-3269-4857-942e-ef7aea7e628b'),(62,62,1,'Ar KM','2023-02-08 03:55:00','2023-02-08 03:55:00','c0670bef-3dea-47f0-8a89-ed521db9da7a'),(63,63,1,'Ca ES','2023-02-08 03:55:01','2023-02-08 03:55:01','e610fc16-dbbb-478f-a948-fd29861aeb8c'),(64,64,1,'Uk UA','2023-02-08 03:55:01','2023-02-08 03:55:01','367eb938-bd09-4196-bc10-d1b348147fdc'),(65,65,1,'En US','2023-02-08 03:55:01','2023-02-08 03:55:01','8a905db9-b782-4083-882e-fc1e081f5770'),(66,66,1,'Ru RU','2023-02-08 03:55:01','2023-02-08 03:55:01','572f9696-f5ee-424b-84af-60f7274385e3'),(67,67,1,'Pt BR','2023-02-08 03:55:01','2023-02-08 03:55:01','52c1de26-6468-4d19-aa7c-9dce5863bf84'),(68,68,1,'Pl PL','2023-02-08 03:55:01','2023-02-08 03:55:01','8d0201c8-9390-4866-a8c7-ce282fb5832c'),(69,69,1,'Hu HU','2023-02-08 03:55:01','2023-02-08 03:55:01','fbaaa2ea-6e8c-4c16-8e0e-342b7d8a1884'),(70,70,1,'En GB','2023-02-08 03:55:01','2023-02-08 03:55:01','1d61fd03-2d61-47d0-9e01-b2a22228cfed'),(71,71,1,'En CA','2023-02-08 03:55:01','2023-02-08 03:55:01','217031e4-4210-4f03-a157-88b463c78093'),(72,72,1,'Nl NL','2023-02-08 03:55:01','2023-02-08 03:55:01','b509cdf2-64e8-4711-a730-e8dee767ea74'),(73,73,1,'Es MX','2023-02-08 03:55:01','2023-02-08 03:55:01','59252002-4bba-471a-b0e9-22330e5c19cc'),(74,74,1,'Sv SE','2023-02-08 03:55:01','2023-02-08 03:55:01','f4c31489-6b06-4cdd-89ff-e428c3468833'),(75,75,1,'Tr TR','2023-02-08 03:55:01','2023-02-08 03:55:01','7cd5f64a-fdf7-4887-8f35-b8c618a7d448'),(76,76,1,'Fi FI','2023-02-08 03:55:01','2023-02-08 03:55:01','663677c8-2106-4b10-a025-f495ef985d7a'),(77,77,1,'Zh CN','2023-02-08 03:55:01','2023-02-08 03:55:01','a4ac5ae3-00ca-4022-8f76-fc0739ebdde6'),(78,78,1,'Ja JP','2023-02-08 03:55:01','2023-02-08 03:55:01','502ce7a7-6d50-472b-9e99-fcb0d633c61e'),(79,79,1,'Fa IR','2023-02-08 03:55:01','2023-02-08 03:55:01','77dee7b7-5007-454a-a872-69e7a8dc3131'),(80,80,1,'Es ES','2023-02-08 03:55:01','2023-02-08 03:55:01','d92c9dde-0665-4e3f-a4b2-0582a5826f74'),(81,81,1,'Fr FR','2023-02-08 03:55:01','2023-02-08 03:55:01','37674657-8883-434a-b5e3-c5378c2ee0b2'),(82,82,1,'He IL','2023-02-08 03:55:01','2023-02-08 03:55:01','fbda3674-6acc-43c3-b57c-24815ba21d36'),(83,83,1,'Ar EG','2023-02-08 03:55:01','2023-02-08 03:55:01','57e76159-f97e-4b38-a7b4-198e3f4a67f1'),(84,84,1,'Mk MK','2023-02-08 03:55:01','2023-02-08 03:55:01','9a1e3b93-b5fd-46dd-8d2a-e54f7f8db501'),(85,85,1,'Cs CZ','2023-02-08 03:55:01','2023-02-08 03:55:01','4ce32f7e-29a7-406f-8cc6-981f96099c85'),(86,86,1,'De DE','2023-02-08 03:55:01','2023-02-08 03:55:01','eb793250-0a54-4d70-90ee-75140cdd38a0'),(87,87,1,'Fr CA','2023-02-08 03:55:01','2023-02-08 03:55:01','48e1f982-bc0d-4f0e-b582-dd6b4caa1702'),(88,88,1,'Ko KR','2023-02-08 03:55:02','2023-02-08 03:55:02','b69115e7-2192-490c-81e7-c0b02ae68ef3'),(89,89,1,'De CH','2023-02-08 03:55:02','2023-02-08 03:55:02','31867c7c-b719-4b91-b54d-5c3b4ae98957'),(90,90,1,'Da DK','2023-02-08 03:55:02','2023-02-08 03:55:02','becdaf9e-dc41-415a-9cf0-3a668667b6fe'),(91,91,1,'It IT','2023-02-08 03:55:02','2023-02-08 03:55:02','af7cc5b5-d3f9-4730-be9e-a9b455d20f43'),(92,92,1,'Zh TW','2023-02-08 03:55:02','2023-02-08 03:55:02','aeb802fc-4e6d-4a63-97e4-04e266ed5fc3'),(93,93,1,'Nb NO','2023-02-08 03:55:02','2023-02-08 03:55:02','7b174f2a-c109-4229-a02e-3755af6dc08f'),(94,94,1,'Ca ES','2023-02-08 03:55:02','2023-02-08 03:55:02','a082e51f-70f6-41da-80ce-5295fab7117d'),(95,95,1,'D3','2023-02-08 03:55:02','2023-02-08 03:55:02','a602c12d-2aff-42c9-b645-bfb361355021'),(96,96,1,'Asset Indexer','2023-02-08 03:55:02','2023-02-08 03:55:02','e5af7b70-6ccc-43eb-acaf-8c507ef46b09'),(97,97,1,'Jquery ui','2023-02-08 03:55:02','2023-02-08 03:55:02','30093ad4-e5e5-49ce-a113-c417309162d9'),(98,98,1,'Jquery ui js LICENSE','2023-02-08 03:55:02','2023-02-08 03:55:02','9c6f5f6b-7ae2-4e68-8a20-63a1dce6a45f'),(99,99,1,'Tailwind reset','2023-02-08 03:55:02','2023-02-08 03:55:02','9642b32c-a295-4e5e-bff6-9f4b6ef0a235'),(100,100,1,'Element resize detector','2023-02-08 03:55:02','2023-02-08 03:55:02','d852a2e7-c2f9-44bb-88dd-d9d12f288371'),(101,101,1,'Element resize detector js LICENSE','2023-02-08 03:55:02','2023-02-08 03:55:02','fc016ced-d96d-4899-96d5-eeb6cdee9afa'),(102,102,1,'Jquery fileupload','2023-02-08 03:55:02','2023-02-08 03:55:02','6f2a1be3-e86f-47fb-bf45-003cdac0adae'),(103,103,1,'Garnish','2023-02-08 03:55:02','2023-02-08 03:55:02','225cc228-1dfd-451b-901a-41389420a574'),(104,104,1,'Garnish js LICENSE','2023-02-08 03:55:02','2023-02-08 03:55:02','e12a1a58-15fe-4323-b524-45f0848eea5f'),(105,105,1,'Picturefill js LICENSE','2023-02-08 03:55:02','2023-02-08 03:55:02','7ef04534-9cac-4a3f-8e43-eb2636a0b992'),(106,106,1,'Picturefill','2023-02-08 03:55:02','2023-02-08 03:55:02','a8da3fa9-54e1-405c-84c5-082c7de735a8'),(107,107,1,'Selectize','2023-02-08 03:55:03','2023-02-08 03:55:03','002af4c4-418c-41cc-9919-20d0268811c0'),(108,108,1,'Jquery payment','2023-02-08 03:55:03','2023-02-08 03:55:03','98bfc2d4-4158-435e-a96f-09af5112aa14'),(109,109,1,'Login','2023-02-08 03:55:03','2023-02-08 03:55:03','10209e81-a9d7-4518-a63e-081530275cef'),(110,110,1,'Condition Builder','2023-02-08 03:55:03','2023-02-08 03:55:03','45e71edd-745c-472a-85d1-6ae68da0a102'),(111,111,1,'Velocity','2023-02-08 03:55:03','2023-02-08 03:55:03','22d3b416-ec8d-476c-971f-8356f17a641d'),(112,112,1,'Velocity js LICENSE','2023-02-08 03:55:03','2023-02-08 03:55:03','7d06bd91-a7e2-4e30-bbda-15db439ec762'),(113,113,1,'Recent Entries Widget','2023-02-08 03:55:03','2023-02-08 03:55:03','320bafab-78bc-44e6-925f-014faeaf1ece'),(114,114,1,'Fabric','2023-02-08 03:55:03','2023-02-08 03:55:03','67dcedd2-5bbd-4e7f-906e-bedf8c760255'),(115,115,1,'Fabric js LICENSE','2023-02-08 03:55:03','2023-02-08 03:55:03','00823b62-8a1f-40fa-bcdd-9ecb1224ee13'),(116,116,1,'Manifest','2023-02-08 03:55:03','2023-02-08 03:55:03','ccc58d11-9418-4b2a-8192-9d050cc96e4f'),(117,117,1,'App','2023-02-08 03:55:03','2023-02-08 03:55:03','ca09b06f-9947-4e3e-87b8-c50dfc0cf19c'),(118,118,1,'App js LICENSE','2023-02-08 03:55:03','2023-02-08 03:55:03','e0fd514f-5aaa-47cb-adb3-a056f0303b19'),(119,119,1,'Resizehandle rtl 2x','2023-02-08 03:55:04','2023-02-08 03:55:04','4e86748b-754d-4c9f-913e-e910e7e0b83f'),(120,120,1,'Resizehandle rtl','2023-02-08 03:55:04','2023-02-08 03:55:04','cf849c31-1211-4731-806a-f82e037a3209'),(121,121,1,'Chrome tablet bottom','2023-02-08 03:55:04','2023-02-08 03:55:04','4d278da4-7ed1-4259-8af5-d1bc409a38a2'),(122,122,1,'Icon phone','2023-02-08 03:55:04','2023-02-08 03:55:04','0861781e-2a03-4559-81c4-2f1b568155e8'),(123,123,1,'Icon desktop','2023-02-08 03:55:04','2023-02-08 03:55:04','f9b011aa-e48d-4c59-89a2-944d1bc011ca'),(124,124,1,'Chrome phone bottom','2023-02-08 03:55:04','2023-02-08 03:55:04','6a78b73a-0bd1-4bdb-92f4-830409e3bb13'),(125,125,1,'Icon tablet','2023-02-08 03:55:04','2023-02-08 03:55:04','8d52877b-c143-429d-a0a2-dbb841d28a43'),(126,126,1,'Chrome tablet top','2023-02-08 03:55:04','2023-02-08 03:55:04','c01a444b-7bf9-4d61-977a-70e5f9340f49'),(127,127,1,'Chrome phone top','2023-02-08 03:55:04','2023-02-08 03:55:04','e98fb945-a7cd-4e70-9677-22f00ace6628'),(128,128,1,'Hudtip right','2023-02-08 03:55:04','2023-02-08 03:55:04','2749ae6e-868d-4398-b878-4f7fff22e40a'),(129,129,1,'User','2023-02-08 03:55:04','2023-02-08 03:55:04','a34cc1f5-3fb5-4597-99c4-eaecd34ce9c7'),(130,130,1,'Welcome logo 2x','2023-02-08 03:55:04','2023-02-08 03:55:04','ea314f0a-1f9b-4395-8c91-9de330ad7768'),(131,131,1,'Temp folder','2023-02-08 03:55:04','2023-02-08 03:55:04','3ccd6bb5-0230-426d-8976-1655579ba5dc'),(132,132,1,'Craft','2023-02-08 03:55:04','2023-02-08 03:55:04','1d358f4a-4b35-47a4-ac14-6238d689be4c'),(133,133,1,'Hudtip bottom','2023-02-08 03:55:04','2023-02-08 03:55:04','79ce3a49-9a06-4e25-8b37-5c6ba8ecd55e'),(134,134,1,'Hudtip bottom gray 2x','2023-02-08 03:55:04','2023-02-08 03:55:04','25f09da3-1046-459a-9ca2-6909d12cd1ed'),(135,135,1,'Listview sort 2x','2023-02-08 03:55:04','2023-02-08 03:55:04','536ffa47-4af8-4760-88ed-a342ef2e7d4c'),(136,136,1,'Welcome logo','2023-02-08 03:55:04','2023-02-08 03:55:04','253bf22e-826c-43f2-a922-4cc4f481cfaf'),(137,137,1,'Resizehandle 2x','2023-02-08 03:55:04','2023-02-08 03:55:04','699123fe-daf0-4468-bb21-f27a1cac2157'),(138,138,1,'Hudtip top 2x','2023-02-08 03:55:04','2023-02-08 03:55:04','23b07eda-789f-4e83-aaa7-badb381452f3'),(139,139,1,'Hudtip top','2023-02-08 03:55:04','2023-02-08 03:55:04','a65ec129-cdfd-457d-95ec-02d5d7daf02a'),(140,140,1,'Resizehandle','2023-02-08 03:55:04','2023-02-08 03:55:04','c6bcd2ae-ddcb-42a0-96bc-e21b48d40604'),(141,141,1,'Safari pinned tab','2023-02-08 03:55:05','2023-02-08 03:55:05','77137ccb-4cc4-403f-9ddc-61786fc58340'),(142,142,1,'Icon','2023-02-08 03:55:05','2023-02-08 03:55:05','a484df84-0fa6-44dd-85be-9c4ab3d40b46'),(143,143,1,'Apple touch icon','2023-02-08 03:55:05','2023-02-08 03:55:05','5e87f2ad-8b03-49bf-a152-f2218c9057dd'),(144,144,1,'Success','2023-02-08 03:55:05','2023-02-08 03:55:05','000cba2b-b112-4099-9081-d62f2db78f58'),(145,145,1,'Filters','2023-02-08 03:55:05','2023-02-08 03:55:05','5323409e-a19e-4ccb-8359-cc30db3e3021'),(146,146,1,'Orientation landscape unchecked','2023-02-08 03:55:05','2023-02-08 03:55:05','570864fe-0572-4134-8f68-9f3bb7bd64cc'),(147,147,1,'Flip horizontal','2023-02-08 03:55:05','2023-02-08 03:55:05','16c53faf-171f-4241-98f2-a599b95385a0'),(148,148,1,'Check','2023-02-08 03:55:05','2023-02-08 03:55:05','059c3ea3-1202-4588-9c2d-9916dd62d8ae'),(149,149,1,'Flip vertical','2023-02-08 03:55:05','2023-02-08 03:55:05','2b93bd88-97e9-435d-927a-6490fb12bb69'),(150,150,1,'Orientation landscape checked','2023-02-08 03:55:05','2023-02-08 03:55:05','ff7120f5-e02d-4c00-8a58-74d382372ed0'),(151,151,1,'Focal point','2023-02-08 03:55:05','2023-02-08 03:55:05','1567de64-375e-4608-85e6-73221c11f3f9'),(152,152,1,'Crop','2023-02-08 03:55:05','2023-02-08 03:55:05','f086b315-32af-4f02-ae52-eef01171c98a'),(153,153,1,'Unconstrained','2023-02-08 03:55:05','2023-02-08 03:55:05','d8d3aa6a-fa04-4948-8674-f15c13c41fa5'),(154,154,1,'Rotate left','2023-02-08 03:55:05','2023-02-08 03:55:05','1722340a-c6c1-4d60-9cbb-d4b179652abd'),(155,155,1,'Orientation portrait unchecked','2023-02-08 03:55:05','2023-02-08 03:55:05','fff9d479-6e9f-4353-808f-4ea203fa5d47'),(156,156,1,'Rotate right','2023-02-08 03:55:05','2023-02-08 03:55:05','5b2aac8e-775d-4f28-b28a-96f04722de6a'),(157,157,1,'Orientation portrait checked','2023-02-08 03:55:05','2023-02-08 03:55:05','951766e4-6eb9-479d-9d84-744456dc5513'),(158,158,1,'Prg','2023-02-08 03:55:05','2023-02-08 03:55:05','08b13e57-2517-4f21-87e4-53eafda673ff'),(159,159,1,'Hudtip left','2023-02-08 03:55:05','2023-02-08 03:55:05','867c1145-edca-44c9-afc4-caf393bbb906'),(160,160,1,'Success 2x','2023-02-08 03:55:05','2023-02-08 03:55:05','54788b00-4691-430a-b6e0-dea13fc00b70'),(161,161,1,'Hudtip bottom 2x','2023-02-08 03:55:05','2023-02-08 03:55:05','7749fdc6-f0b2-43f3-b2f0-5a6bf4c337f1'),(162,162,1,'Craftcms','2023-02-08 03:55:05','2023-02-08 03:55:05','51b640cd-c500-47ee-8a7e-cf3dc1bfadd5'),(163,163,1,'Hudtip left 2x','2023-02-08 03:55:05','2023-02-08 03:55:05','c1be551d-4ebf-4b2a-a41c-a7b87b48963c'),(164,164,1,'Dev mode','2023-02-08 03:55:05','2023-02-08 03:55:05','b36e6bc4-03a4-47c6-9222-ef8b3c3b5971'),(165,165,1,'Branch rtl','2023-02-08 03:55:05','2023-02-08 03:55:05','30c13400-0d09-4ba8-98ed-b8d9aa9d581a'),(166,166,1,'Craft 2x','2023-02-08 03:55:05','2023-02-08 03:55:05','41ff023d-f9af-4e8d-aede-411568ffa96e'),(167,167,1,'Listview sort','2023-02-08 03:55:06','2023-02-08 03:55:06','dbc720d7-5737-4451-8c26-39cb2f4f550f'),(168,168,1,'Branch rtl 2x','2023-02-08 03:55:06','2023-02-08 03:55:06','7d4d279c-2a72-4f72-9817-7f2d5b77e746'),(169,169,1,'Hudtip right 2x','2023-02-08 03:55:06','2023-02-08 03:55:06','30cf685f-eeb0-4470-af3f-5a0a253bad93'),(170,170,1,'Branch','2023-02-08 03:55:06','2023-02-08 03:55:06','e4d50f19-37dc-44b3-967b-048baf188779'),(171,171,1,'Hudtip bottom gray','2023-02-08 03:55:06','2023-02-08 03:55:06','4b62ebda-0406-4479-9983-10ab467f00b6'),(172,172,1,'Branch 2x','2023-02-08 03:55:06','2023-02-08 03:55:06','a72d42de-11f0-423b-98f6-2b147e608582'),(173,173,1,'Cp','2023-02-08 03:55:06','2023-02-08 03:55:06','d33e3a1a-d957-4de2-bc21-9dbe6e2f521b'),(174,174,1,'Craft','2023-02-08 03:55:06','2023-02-08 03:55:06','dd55232e-f985-45df-b528-7242aab93e92'),(175,175,1,'Feed Widget','2023-02-08 03:55:06','2023-02-08 03:55:06','33ca3d6b-27b1-479e-9a17-94bc042fa4e0'),(176,176,1,'Updates Widget','2023-02-08 03:55:06','2023-02-08 03:55:06','e3b12817-5488-4ae5-ad6e-c99eb028647c'),(177,177,1,'Axios js LICENSE','2023-02-08 03:55:06','2023-02-08 03:55:06','480e3011-6a63-4f08-a6ee-a8592f1627b0'),(178,178,1,'Axios','2023-02-08 03:55:06','2023-02-08 03:55:06','f0cb8b88-8de7-4d24-878f-cca34e0c4aef'),(179,179,1,'Jquery mobile events','2023-02-08 03:55:06','2023-02-08 03:55:06','a7366341-3b3e-44c8-b05a-95cbe7a9481c'),(180,180,1,'Jquery mobile events js LICENSE','2023-02-08 03:55:06','2023-02-08 03:55:06','996f6fe0-d465-4d91-9add-28657a8e1399'),(181,181,1,'Iframe Resizer content Window','2023-02-08 03:55:06','2023-02-08 03:55:06','a8ae9e53-319e-41ec-915c-b7a60cb978bc'),(182,182,1,'Iframe Resizer','2023-02-08 03:55:07','2023-02-08 03:55:07','ef403fd7-95d1-472f-b05e-84cf6b27dd6b'),(183,183,1,'Db','2023-02-08 03:55:07','2023-02-08 03:55:07','7ff4ac43-1b95-4684-9a7d-87fd4b2eb861'),(184,184,1,'Account','2023-02-08 03:55:07','2023-02-08 03:55:07','83f02313-a710-4cf8-b4e7-48b1e22a191a'),(185,185,1,'Site','2023-02-08 03:55:07','2023-02-08 03:55:07','c6bd9e81-6715-479d-80c8-eff7b4a67e29'),(186,186,1,'Installer bg','2023-02-08 03:55:07','2023-02-08 03:55:07','50ccd320-76d1-40e2-abcf-773017142076'),(187,187,1,'Install','2023-02-08 03:55:07','2023-02-08 03:55:07','99fe87f9-be2c-4ab9-acd0-7339449241ca'),(188,188,1,'Prism','2023-02-08 03:55:07','2023-02-08 03:55:07','dd065473-d879-45c3-8903-b6df16b9a6d0'),(189,189,1,'Jquery js LICENSE','2023-02-08 03:55:07','2023-02-08 03:55:07','33ae28b1-3de5-4a0e-a676-a917ca6e42e4'),(190,190,1,'Jquery','2023-02-08 03:55:07','2023-02-08 03:55:07','fbf55f05-31fc-473a-b38f-9b882015aad2'),(191,191,1,'Vue','2023-02-08 03:55:07','2023-02-08 03:55:07','9a638410-6df7-4f4d-8fe9-6f0b646f6f58'),(192,192,1,'Vue js LICENSE','2023-02-08 03:55:07','2023-02-08 03:55:07','0be3bd82-019d-4d96-9bf2-4feefa062786'),(193,193,1,'Manifest','2023-02-08 03:55:08','2023-02-08 03:55:08','b0c9fb7f-831b-4c5f-9f65-aade1b5bc218'),(194,194,1,'Queue manager','2023-02-08 03:55:08','2023-02-08 03:55:08','6f94ad4a-95d4-4ee7-b14c-ee4ed9e142b5'),(195,195,1,'Queue manager js LICENSE','2023-02-08 03:55:08','2023-02-08 03:55:08','a9410d7a-9d3b-4cb4-bd5f-8eccd05e2be2'),(196,196,1,'Utilities','2023-02-08 03:55:08','2023-02-08 03:55:08','d8b2d1e8-4ad9-4460-b48e-460b9a586d55'),(197,197,1,'Craft Support Widget','2023-02-08 03:55:08','2023-02-08 03:55:08','8d3a9489-b50f-428a-8c30-f614ba41ece9'),(198,198,1,'Craft partners','2023-02-08 03:55:08','2023-02-08 03:55:08','d61b84d5-4601-414c-be34-22d93a80b509'),(199,199,1,'Craftquest','2023-02-08 03:55:08','2023-02-08 03:55:08','e634cb4c-37e7-4c4e-8388-31ad42a048e3'),(200,200,1,'Discord','2023-02-08 03:55:08','2023-02-08 03:55:08','123e446f-9e0e-4632-a6ab-659f966aaba4'),(201,201,1,'Do research','2023-02-08 06:12:08','2023-02-08 06:23:38','e3d2d230-eb5e-46e5-8e0a-3efff8302add'),(202,202,1,'Dashboard','2023-02-08 06:23:29','2023-02-08 06:23:29','96eb533d-1477-422c-9722-3c9a2f630042'),(203,203,1,'Xregexp all js LICENSE','2023-02-08 06:23:29','2023-02-08 06:23:29','27199761-7bb0-4655-bb07-81eeecb7636a'),(204,204,1,'Xregexp all','2023-02-08 06:23:29','2023-02-08 06:23:29','426012ca-e784-4c6b-aecc-33ce8addf82d'),(205,205,1,'Htmx min','2023-02-08 06:23:29','2023-02-08 06:23:29','37056a78-7f99-499a-bd87-02e92f652739'),(206,206,1,'Ar OM','2023-02-08 06:23:29','2023-02-08 06:23:29','3435ea3a-aa30-4fab-80f7-9b3fccb0232e'),(207,207,1,'Uk UA','2023-02-08 06:23:29','2023-02-08 06:23:29','74a456c3-f2b5-47ed-b597-38995023da81'),(208,208,1,'Ar QA','2023-02-08 06:23:29','2023-02-08 06:23:29','8d08ce4c-f048-42eb-a90b-781ec8716337'),(209,209,1,'Es BO','2023-02-08 06:23:29','2023-02-08 06:23:29','1146b682-2140-4ce1-b9b2-a9a9d4472836'),(210,210,1,'En US','2023-02-08 06:23:29','2023-02-08 06:23:29','f9b62845-8770-43f5-86f4-2f4894a8c8cb'),(211,211,1,'Ru RU','2023-02-08 06:23:29','2023-02-08 06:23:29','ca839c99-7cf1-47df-95a5-f718c0604316'),(212,212,1,'Ar YE','2023-02-08 06:23:29','2023-02-08 06:23:29','15c8624e-1d7a-4e79-bfec-40a98878ebac'),(213,213,1,'Ar PS','2023-02-08 06:23:29','2023-02-08 06:23:29','06aaa5cb-a502-4c68-8217-7480a23fad4d'),(214,214,1,'Pt BR','2023-02-08 06:23:29','2023-02-08 06:23:29','2048f0ad-71b5-4dd1-bad7-9c2f8178ce30'),(215,215,1,'Ar KW','2023-02-08 06:23:29','2023-02-08 06:23:29','142e9957-3943-40cf-a913-f52ca5c775a4'),(216,216,1,'Pl PL','2023-02-08 06:23:29','2023-02-08 06:23:29','db5f37bb-f1d8-4eb4-b18a-eaab2fbe0a0e'),(217,217,1,'Ar SD','2023-02-08 06:23:29','2023-02-08 06:23:29','26910a3d-ca4f-4ff1-a3c1-69cbb90e3179'),(218,218,1,'Ar 001','2023-02-08 06:23:29','2023-02-08 06:23:29','5fde91a2-50f1-4a0d-9cfc-6d94d9f6d1f3'),(219,219,1,'Ar MR','2023-02-08 06:23:30','2023-02-08 06:23:30','1a861962-4287-4192-86f8-65f2f3a1c3b9'),(220,220,1,'Hu HU','2023-02-08 06:23:30','2023-02-08 06:23:30','86bdbc25-65df-40db-8feb-13e751570b34'),(221,221,1,'En GB','2023-02-08 06:23:30','2023-02-08 06:23:30','8f6089d8-fe9e-43ec-b02d-f004512e6917'),(222,222,1,'En CA','2023-02-08 06:23:30','2023-02-08 06:23:30','af2bcaf8-917a-4341-8a49-2cad787041d2'),(223,223,1,'Ar ER','2023-02-08 06:23:30','2023-02-08 06:23:30','a654b32a-be8e-40e8-a9d5-b7111bfe9122'),(224,224,1,'Nl NL','2023-02-08 06:23:30','2023-02-08 06:23:30','65284119-98f3-4a57-a3b7-abc09146b5ce'),(225,225,1,'Es MX','2023-02-08 06:23:30','2023-02-08 06:23:30','efac5940-e595-43a9-adbe-27876407ecd9'),(226,226,1,'Sv SE','2023-02-08 06:23:30','2023-02-08 06:23:30','d2c77d7f-11f3-4f29-9f3f-9a2e7fc3fbc8'),(227,227,1,'Ar LB','2023-02-08 06:23:30','2023-02-08 06:23:30','4856537b-8c0c-4943-9e72-adfb4b988877'),(228,228,1,'Ar JO','2023-02-08 06:23:30','2023-02-08 06:23:30','19eda767-2cdf-4a9e-ba78-165c2da803eb'),(229,229,1,'Fi FI','2023-02-08 06:23:30','2023-02-08 06:23:30','75371517-d1d5-436d-a5b1-27459f2b946d'),(230,230,1,'Zh CN','2023-02-08 06:23:30','2023-02-08 06:23:30','49c66c71-d501-4af5-b617-ae1b5fd93508'),(231,231,1,'Ja JP','2023-02-08 06:23:30','2023-02-08 06:23:30','9e698750-2a18-49e8-8c2d-d9afcb32dcb5'),(232,232,1,'Ar SO','2023-02-08 06:23:30','2023-02-08 06:23:30','88d0c716-61e5-4df9-a635-8acaaaeee487'),(233,233,1,'En IN','2023-02-08 06:23:30','2023-02-08 06:23:30','e8ef8031-66d8-4426-aea5-f2312dfb88ae'),(234,234,1,'Es ES','2023-02-08 06:23:30','2023-02-08 06:23:30','1db260ce-6b35-4fd1-8731-de0872e0f878'),(235,235,1,'Ar TN','2023-02-08 06:23:30','2023-02-08 06:23:30','273104b3-617e-4e43-896b-af018bd20616'),(236,236,1,'Fr FR','2023-02-08 06:23:30','2023-02-08 06:23:30','de5407f5-35f3-4bb9-9a2f-b985cace8c53'),(237,237,1,'He IL','2023-02-08 06:23:30','2023-02-08 06:23:30','d77871e2-2530-4d5e-aed3-8e045912652b'),(238,238,1,'Ar EG','2023-02-08 06:23:30','2023-02-08 06:23:30','4c9683f2-5cb0-4d4d-ae24-89923f2f4711'),(239,239,1,'En IE','2023-02-08 06:23:30','2023-02-08 06:23:30','97d5e59d-365b-4ba1-8638-288f69bae767'),(240,240,1,'Mk MK','2023-02-08 06:23:30','2023-02-08 06:23:30','e542f146-af7b-447e-85cd-a6c56fbb09ae'),(241,241,1,'Ar LY','2023-02-08 06:23:30','2023-02-08 06:23:30','8cf67c10-9685-46ae-bc59-d128f36a99fc'),(242,242,1,'Ar IQ','2023-02-08 06:23:30','2023-02-08 06:23:30','9db63b28-3390-4aa4-ae71-caea12dc7922'),(243,243,1,'Ar MA','2023-02-08 06:23:30','2023-02-08 06:23:30','871c198c-e48b-4c91-a232-424e33419e96'),(244,244,1,'Cs CZ','2023-02-08 06:23:30','2023-02-08 06:23:30','2c2822e9-3c24-4461-9bc6-8ff067cbdbd2'),(245,245,1,'De DE','2023-02-08 06:23:30','2023-02-08 06:23:30','c6b6e040-13f7-4e5b-838c-3ef777c12234'),(246,246,1,'Ar SA','2023-02-08 06:23:30','2023-02-08 06:23:30','976a1a32-d396-44a9-b46b-b66b5d7725ab'),(247,247,1,'Fr CA','2023-02-08 06:23:31','2023-02-08 06:23:31','a6b6fdc9-c78b-43d0-a0df-e50b7382ce10'),(248,248,1,'Ar DZ','2023-02-08 06:23:31','2023-02-08 06:23:31','d6298380-8adc-422a-bb93-9cb149777335'),(249,249,1,'Ar SY','2023-02-08 06:23:31','2023-02-08 06:23:31','ccbc5b32-3df0-4db8-a6e8-36eeaa199a77'),(250,250,1,'Ar EH','2023-02-08 06:23:31','2023-02-08 06:23:31','8bbb21bd-c2f8-41d4-8f65-cc790b6bcec7'),(251,251,1,'Ko KR','2023-02-08 06:23:31','2023-02-08 06:23:31','9cb1a6e5-1417-44e0-93fe-a2a5a603a695'),(252,252,1,'De CH','2023-02-08 06:23:31','2023-02-08 06:23:31','9ad0c8eb-6437-4cfb-8d47-a2d7f221c6ab'),(253,253,1,'Ar BH','2023-02-08 06:23:31','2023-02-08 06:23:31','785a1c97-af31-4207-b750-71e3ec1a37bc'),(254,254,1,'It IT','2023-02-08 06:23:31','2023-02-08 06:23:31','a9a05a16-0da1-4d92-be4f-84adc13893f4'),(255,255,1,'Ar SS','2023-02-08 06:23:31','2023-02-08 06:23:31','90b74e47-01d9-4ce8-b4c4-5f2fa26d475d'),(256,256,1,'Ar DJ','2023-02-08 06:23:31','2023-02-08 06:23:31','50532a7d-a6e8-4d88-9cfd-b8dff9be2750'),(257,257,1,'Ar IL','2023-02-08 06:23:31','2023-02-08 06:23:31','65cec5ce-099b-4d14-becf-32cb4852d607'),(258,258,1,'Ar AE','2023-02-08 06:23:31','2023-02-08 06:23:31','db4fe56e-e16d-4326-babf-63250496f91d'),(259,259,1,'Ar TD','2023-02-08 06:23:31','2023-02-08 06:23:31','9bb5391b-2dcd-427a-9844-5ecdaba67633'),(260,260,1,'Ar KM','2023-02-08 06:23:31','2023-02-08 06:23:31','c3e31cb5-1f3c-4c93-8dea-3b34bc69b3e3'),(261,261,1,'Ca ES','2023-02-08 06:23:31','2023-02-08 06:23:31','3c8199b1-7d73-47ea-af5b-f92e745e5c8a'),(262,262,1,'Uk UA','2023-02-08 06:23:31','2023-02-08 06:23:31','636e2359-9438-4717-b651-c2ff0e670d0b'),(263,263,1,'En US','2023-02-08 06:23:31','2023-02-08 06:23:31','140a1017-e3f9-4518-9d39-ca13ace5ba41'),(264,264,1,'Ru RU','2023-02-08 06:23:31','2023-02-08 06:23:31','0627cee6-cb95-4a79-8870-4e8e1492551f'),(265,265,1,'Pt BR','2023-02-08 06:23:31','2023-02-08 06:23:31','e6f1de75-c39c-43f6-bb62-0749d0aeffc4'),(266,266,1,'Pl PL','2023-02-08 06:23:31','2023-02-08 06:23:31','19bfc4d5-b573-4d60-8178-c0dcb248d7fe'),(267,267,1,'Hu HU','2023-02-08 06:23:31','2023-02-08 06:23:31','21cf735e-88cb-422a-9361-841936161315'),(268,268,1,'En GB','2023-02-08 06:23:31','2023-02-08 06:23:31','1a7f3a39-6ca2-4031-ae16-b0dce40b7886'),(269,269,1,'En CA','2023-02-08 06:23:31','2023-02-08 06:23:31','99941a1f-e55b-4a98-8aa1-3165d92beb0b'),(270,270,1,'Nl NL','2023-02-08 06:23:31','2023-02-08 06:23:31','873d7ecf-e636-412b-99f1-cda1da7d97aa'),(271,271,1,'Es MX','2023-02-08 06:23:31','2023-02-08 06:23:31','c17bca19-8c98-4739-9701-cb9d9e3409d8'),(272,272,1,'Sv SE','2023-02-08 06:23:31','2023-02-08 06:23:31','1cf03c5a-e895-4de4-ab69-524ee20ff54d'),(273,273,1,'Tr TR','2023-02-08 06:23:31','2023-02-08 06:23:31','866ee725-5ed9-40e1-af09-7e26a499db4c'),(274,274,1,'Fi FI','2023-02-08 06:23:32','2023-02-08 06:23:32','7be5c3c3-4d0d-47b2-8822-bc1e376b71a6'),(275,275,1,'Zh CN','2023-02-08 06:23:32','2023-02-08 06:23:32','786ce5c4-d6c1-4756-99fb-77c09163de8d'),(276,276,1,'Ja JP','2023-02-08 06:23:32','2023-02-08 06:23:32','832b4706-395b-49ae-abc8-936e57a134f0'),(277,277,1,'Fa IR','2023-02-08 06:23:32','2023-02-08 06:23:32','9280dd27-be2b-4908-a590-a9bc1c8a071d'),(278,278,1,'Es ES','2023-02-08 06:23:32','2023-02-08 06:23:32','b2411a8a-0a87-4b7b-ae52-3b4c1606ff69'),(279,279,1,'Fr FR','2023-02-08 06:23:32','2023-02-08 06:23:32','28f9d04b-7f20-4df0-b67d-9aa96eedfbdf'),(280,280,1,'He IL','2023-02-08 06:23:32','2023-02-08 06:23:32','9a675dcd-fa5b-4941-b514-2c6a94af3aed'),(281,281,1,'Ar EG','2023-02-08 06:23:32','2023-02-08 06:23:32','ccd9c449-5a43-4b4c-9603-885e23afe904'),(282,282,1,'Mk MK','2023-02-08 06:23:32','2023-02-08 06:23:32','4b9dfa97-ab9e-44cf-85ca-5d2d3d5eb29a'),(283,283,1,'Cs CZ','2023-02-08 06:23:32','2023-02-08 06:23:32','c3a74935-e467-4ffd-95cd-f557e1002082'),(284,284,1,'De DE','2023-02-08 06:23:32','2023-02-08 06:23:32','c2e7f2ca-ceae-4a9e-938c-ab50da570e80'),(285,285,1,'Fr CA','2023-02-08 06:23:32','2023-02-08 06:23:32','e7037cef-7796-43ba-afe8-c6dafaa09a3a'),(286,286,1,'Ko KR','2023-02-08 06:23:32','2023-02-08 06:23:32','722bdaee-4302-4122-8273-d0f5461abaca'),(287,287,1,'De CH','2023-02-08 06:23:32','2023-02-08 06:23:32','408dfe5e-f0bb-49c7-b071-0ff679b0aec0'),(288,288,1,'Da DK','2023-02-08 06:23:32','2023-02-08 06:23:32','c62fd899-a675-47ed-8855-7f55a0d4f77d'),(289,289,1,'It IT','2023-02-08 06:23:32','2023-02-08 06:23:32','dc7550fd-f528-4597-95d3-dd028f94a390'),(290,290,1,'Zh TW','2023-02-08 06:23:32','2023-02-08 06:23:32','4564c295-a3c5-4de2-9e85-9173d3cb1073'),(291,291,1,'Nb NO','2023-02-08 06:23:32','2023-02-08 06:23:32','a9e1189c-f12f-47ab-87bd-9ca5d6ff7ae1'),(292,292,1,'Ca ES','2023-02-08 06:23:32','2023-02-08 06:23:32','2e554d71-6101-45a7-a2fc-ce8cf17d4021'),(293,293,1,'D3','2023-02-08 06:23:32','2023-02-08 06:23:32','d5c7f8ee-1e92-4c62-abe0-09214a972214'),(294,294,1,'Asset Indexer','2023-02-08 06:23:32','2023-02-08 06:23:32','4e4a388c-9830-467b-8d4e-034093e6d1e9'),(295,295,1,'Jquery ui','2023-02-08 06:23:32','2023-02-08 06:23:32','80c9218f-1ba6-49e8-9011-d8386db96319'),(296,296,1,'Jquery ui js LICENSE','2023-02-08 06:23:32','2023-02-08 06:23:32','d92b494b-bf31-4f2c-84dd-ce2f2330fa3a'),(297,297,1,'Tailwind reset','2023-02-08 06:23:32','2023-02-08 06:23:32','6f186ad2-f490-4d4f-b7e2-fc6af7dc203c'),(298,298,1,'Element resize detector','2023-02-08 06:23:33','2023-02-08 06:23:33','2202292f-8324-4c6e-b1ef-8694af90543e'),(299,299,1,'Element resize detector js LICENSE','2023-02-08 06:23:33','2023-02-08 06:23:33','0d1110b9-a8d3-4b95-8144-6a4083dd957e'),(300,300,1,'Jquery fileupload','2023-02-08 06:23:33','2023-02-08 06:23:33','350f24ee-fd11-4d49-aca3-2b321be9deba'),(301,301,1,'Garnish','2023-02-08 06:23:33','2023-02-08 06:23:33','b34c8441-7a78-433d-aac6-f36fce812149'),(302,302,1,'Garnish js LICENSE','2023-02-08 06:23:33','2023-02-08 06:23:33','531f62ef-fbae-4262-8119-7c2e0c5b280a'),(303,303,1,'Picturefill js LICENSE','2023-02-08 06:23:33','2023-02-08 06:23:33','1052a301-88ea-4f3e-9432-cbcb23bf61a1'),(304,304,1,'Picturefill','2023-02-08 06:23:33','2023-02-08 06:23:33','c5d2d793-c1bd-4a34-9ae0-05c7612c1b5d'),(305,305,1,'Selectize','2023-02-08 06:23:33','2023-02-08 06:23:33','91a737f2-8b64-429a-b9ec-8065caf91e8f'),(306,306,1,'Jquery payment','2023-02-08 06:23:33','2023-02-08 06:23:33','420b95f3-1edc-4ecf-87c4-a4b07c6a1ec1'),(307,307,1,'Login','2023-02-08 06:23:33','2023-02-08 06:23:33','dd3eea85-0583-4ca5-85fa-b3a987bfe3cd'),(308,308,1,'Condition Builder','2023-02-08 06:23:33','2023-02-08 06:23:33','782ad179-b515-4ab0-bacd-1efbd32961de'),(309,309,1,'Velocity','2023-02-08 06:23:33','2023-02-08 06:23:33','4b240213-a8f2-4b77-abc4-616a79639faf'),(310,310,1,'Velocity js LICENSE','2023-02-08 06:23:33','2023-02-08 06:23:33','3643626e-631b-4d6d-8eae-5f7c0f8ec37f'),(311,311,1,'Recent Entries Widget','2023-02-08 06:23:34','2023-02-08 06:23:34','0ef2e340-93e4-4ba4-8635-173a4497251a'),(312,312,1,'Fabric','2023-02-08 06:23:34','2023-02-08 06:23:34','ed7fa9f2-76fd-47e5-ae19-f6fc8c80b217'),(313,313,1,'Fabric js LICENSE','2023-02-08 06:23:34','2023-02-08 06:23:34','72ccc5c9-5d56-4dc3-af2a-250ceb9813b4'),(314,314,1,'Manifest','2023-02-08 06:23:34','2023-02-08 06:23:34','db11b7ca-6327-4f43-aaab-5e95d60d1ae8'),(315,315,1,'App','2023-02-08 06:23:34','2023-02-08 06:23:34','ab5f9e48-b1a0-4f7e-8346-2298c4a72420'),(316,316,1,'App js LICENSE','2023-02-08 06:23:34','2023-02-08 06:23:34','52120acf-a288-4667-b14f-745ea92b8fd0'),(317,317,1,'Resizehandle rtl 2x','2023-02-08 06:23:34','2023-02-08 06:23:34','504082fc-c670-41c9-9361-9a9fedfc2344'),(318,318,1,'Resizehandle rtl','2023-02-08 06:23:34','2023-02-08 06:23:34','7a63e8c9-9b2d-4fca-b7b8-ec36d024f656'),(319,319,1,'Chrome tablet bottom','2023-02-08 06:23:34','2023-02-08 06:23:34','551a7a6e-b136-4fe3-9817-cf9207a0cad0'),(320,320,1,'Icon phone','2023-02-08 06:23:34','2023-02-08 06:23:34','b424d17d-9074-4b7f-816d-5075386ad70f'),(321,321,1,'Icon desktop','2023-02-08 06:23:34','2023-02-08 06:23:34','85061b17-c23c-457d-9933-5bbd09aa0beb'),(322,322,1,'Chrome phone bottom','2023-02-08 06:23:34','2023-02-08 06:23:34','2f9a043e-8f81-4e18-8b64-92af977b4950'),(323,323,1,'Icon tablet','2023-02-08 06:23:34','2023-02-08 06:23:34','923822b7-bc1a-4757-b065-02572e33d05c'),(324,324,1,'Chrome tablet top','2023-02-08 06:23:34','2023-02-08 06:23:34','ae494db0-57dc-4ed9-90bc-dbdf89d69fed'),(325,325,1,'Chrome phone top','2023-02-08 06:23:34','2023-02-08 06:23:34','046ad41d-6bd6-466b-bcce-8c2f6288039b'),(326,326,1,'Hudtip right','2023-02-08 06:23:34','2023-02-08 06:23:34','c0bd8497-5429-4223-869d-8c3cd2789d12'),(327,327,1,'User','2023-02-08 06:23:34','2023-02-08 06:23:34','52ef97da-9dcd-4e32-8536-04a141883798'),(328,328,1,'Welcome logo 2x','2023-02-08 06:23:34','2023-02-08 06:23:34','3cfde08a-b79e-480d-b156-706cc80c4147'),(329,329,1,'Temp folder','2023-02-08 06:23:34','2023-02-08 06:23:34','2d720c13-a77a-4863-8bb6-6efde1c1f99f'),(330,330,1,'Craft','2023-02-08 06:23:34','2023-02-08 06:23:34','5290cad5-64ce-4574-b1ef-f260fa14b8f9'),(331,331,1,'Hudtip bottom','2023-02-08 06:23:34','2023-02-08 06:23:34','197e29ed-ebd6-4065-be33-0751825caf94'),(332,332,1,'Hudtip bottom gray 2x','2023-02-08 06:23:35','2023-02-08 06:23:35','7fd5d339-102d-4557-bfe9-c66bb3b4eb38'),(333,333,1,'Listview sort 2x','2023-02-08 06:23:35','2023-02-08 06:23:35','afecca6b-b924-488b-a05f-b0ccb09a8225'),(334,334,1,'Welcome logo','2023-02-08 06:23:35','2023-02-08 06:23:35','3d57f34d-8f9c-48d0-bff7-a688bd3b910d'),(335,335,1,'Resizehandle 2x','2023-02-08 06:23:35','2023-02-08 06:23:35','b466a833-b953-48a6-9775-0e4a3cb08a9f'),(336,336,1,'Hudtip top 2x','2023-02-08 06:23:35','2023-02-08 06:23:35','017cc3c7-e9fd-42fa-8c12-30e2ee0568a0'),(337,337,1,'Hudtip top','2023-02-08 06:23:35','2023-02-08 06:23:35','521353b8-1dc6-4667-9463-8254762fdf82'),(338,338,1,'Resizehandle','2023-02-08 06:23:35','2023-02-08 06:23:35','8a7107ef-6d4e-4e9c-ba4f-250ebdd73399'),(339,339,1,'Safari pinned tab','2023-02-08 06:23:35','2023-02-08 06:23:35','07787f6d-0892-4d8c-b3ef-35cc7be3bb45'),(340,340,1,'Icon','2023-02-08 06:23:35','2023-02-08 06:23:35','c34f0853-4988-46ca-a4c8-bae75a1e1c9d'),(341,341,1,'Apple touch icon','2023-02-08 06:23:35','2023-02-08 06:23:35','68a0d2ce-2094-4def-9c50-fd6e65ccf7ec'),(342,342,1,'Success','2023-02-08 06:23:35','2023-02-08 06:23:35','e772c0cf-3b19-44cf-bece-7ddcf9a5e4f9'),(343,343,1,'Filters','2023-02-08 06:23:35','2023-02-08 06:23:35','e9eaa170-fe0e-4080-8c71-e968af2a728d'),(344,344,1,'Orientation landscape unchecked','2023-02-08 06:23:35','2023-02-08 06:23:35','83649e27-a7ef-4356-b6bf-74ec53bb265b'),(345,345,1,'Flip horizontal','2023-02-08 06:23:35','2023-02-08 06:23:35','713a88bc-02c0-4096-a432-f2d5f4677c20'),(346,346,1,'Check','2023-02-08 06:23:35','2023-02-08 06:23:35','f7523f75-a020-4a94-8484-3865f073d6a4'),(347,347,1,'Flip vertical','2023-02-08 06:23:35','2023-02-08 06:23:35','1ed4b8cb-9439-4c3b-adfb-c60e912e2545'),(348,348,1,'Orientation landscape checked','2023-02-08 06:23:35','2023-02-08 06:23:35','82304eac-820c-4a57-a3cc-3d96dbac11b9'),(349,349,1,'Focal point','2023-02-08 06:23:35','2023-02-08 06:23:35','4626dfe2-799f-4329-8338-848cd7e04a43'),(350,350,1,'Crop','2023-02-08 06:23:35','2023-02-08 06:23:35','e625960a-7fb1-4226-9fb6-642fc6ce78ae'),(351,351,1,'Unconstrained','2023-02-08 06:23:35','2023-02-08 06:23:35','ea96096c-b3ba-435e-97f3-c69d5efff058'),(352,352,1,'Rotate left','2023-02-08 06:23:35','2023-02-08 06:23:35','2c9bb69c-f67e-4108-b189-6c2b046ae7b0'),(353,353,1,'Orientation portrait unchecked','2023-02-08 06:23:35','2023-02-08 06:23:35','bac8fe61-3496-47a3-9dd9-39ae27855db3'),(354,354,1,'Rotate right','2023-02-08 06:23:35','2023-02-08 06:23:35','c98f376a-b19b-4aa6-ad48-79883e76dae3'),(355,355,1,'Orientation portrait checked','2023-02-08 06:23:35','2023-02-08 06:23:35','6580cc54-91bb-43c9-ab91-d817dfbed625'),(356,356,1,'Prg','2023-02-08 06:23:35','2023-02-08 06:23:35','31cffce8-6225-4b82-b9d5-e08d3646893c'),(357,357,1,'Hudtip left','2023-02-08 06:23:35','2023-02-08 06:23:35','cc5d7a4c-e8ae-4025-98a5-ad946a3446d2'),(358,358,1,'Success 2x','2023-02-08 06:23:36','2023-02-08 06:23:36','98732a89-45be-4733-99c2-8e8a31573f37'),(359,359,1,'Hudtip bottom 2x','2023-02-08 06:23:36','2023-02-08 06:23:36','adc7277e-b39f-434a-b003-41ced4584593'),(360,360,1,'Craftcms','2023-02-08 06:23:36','2023-02-08 06:23:36','d738b45d-7a18-4eec-8321-216ae20f7d28'),(361,361,1,'Hudtip left 2x','2023-02-08 06:23:36','2023-02-08 06:23:36','8213bd71-9dec-4bde-bb76-bbf4b3bde1cc'),(362,362,1,'Dev mode','2023-02-08 06:23:36','2023-02-08 06:23:36','32ebe213-2dc4-4056-a707-012de2edbfd2'),(363,363,1,'Branch rtl','2023-02-08 06:23:36','2023-02-08 06:23:36','24233ac4-c1f1-494e-92be-660ddc2baf8e'),(364,364,1,'Craft 2x','2023-02-08 06:23:36','2023-02-08 06:23:36','561a7483-67c9-4bc1-b2e0-bcff5a0696e0'),(365,365,1,'Listview sort','2023-02-08 06:23:36','2023-02-08 06:23:36','b1cede40-77a9-4219-aed5-ac271c4669c7'),(366,366,1,'Branch rtl 2x','2023-02-08 06:23:36','2023-02-08 06:23:36','bc01ad86-69f1-4c9a-85f8-87a609277b96'),(367,367,1,'Hudtip right 2x','2023-02-08 06:23:36','2023-02-08 06:23:36','dd5e8507-a1f7-488d-b344-470b0b05c1e5'),(368,368,1,'Branch','2023-02-08 06:23:36','2023-02-08 06:23:36','ef89d5d4-4c42-4ee3-b7da-b09c0ece67d0'),(369,369,1,'Hudtip bottom gray','2023-02-08 06:23:36','2023-02-08 06:23:36','f01d6318-ebad-4c54-b813-885e256a219e'),(370,370,1,'Branch 2x','2023-02-08 06:23:36','2023-02-08 06:23:36','50e42e53-4d87-4c74-852d-5d5dac28f651'),(371,371,1,'Cp','2023-02-08 06:23:36','2023-02-08 06:23:36','db595b17-3f1c-4bd1-a3d8-41f8fece2165'),(372,372,1,'Craft','2023-02-08 06:23:36','2023-02-08 06:23:36','c55abca5-1dbe-4a72-a8f1-41c2bd987bc6'),(373,373,1,'Feed Widget','2023-02-08 06:23:36','2023-02-08 06:23:36','b92731df-2c15-4c55-b914-e74742fb31bf'),(374,374,1,'Updates Widget','2023-02-08 06:23:36','2023-02-08 06:23:36','785eb084-5364-4d45-b085-902e7c042f1f'),(375,375,1,'Axios js LICENSE','2023-02-08 06:23:37','2023-02-08 06:23:37','085744a0-3d24-427f-a6b9-fc8380f7856a'),(376,376,1,'Axios','2023-02-08 06:23:37','2023-02-08 06:23:37','dbef0d58-4855-485f-9a9e-42e276b5f264'),(377,377,1,'Jquery mobile events','2023-02-08 06:23:37','2023-02-08 06:23:37','27e71b45-a26d-45ee-8121-20bfd0c6cab2'),(378,378,1,'Jquery mobile events js LICENSE','2023-02-08 06:23:37','2023-02-08 06:23:37','cc98cda3-e913-490f-a96d-fdc8fccff0d3'),(379,379,1,'Iframe Resizer content Window','2023-02-08 06:23:37','2023-02-08 06:23:37','75c80568-3d9a-44d5-8894-c0716255bafe'),(380,380,1,'Iframe Resizer','2023-02-08 06:23:37','2023-02-08 06:23:37','5beaec05-e6cd-4c27-91a8-8cdca6d5bfeb'),(381,381,1,'Db','2023-02-08 06:23:37','2023-02-08 06:23:37','479d3e47-dd79-4d91-826f-14b004b1313d'),(382,382,1,'Account','2023-02-08 06:23:37','2023-02-08 06:23:37','3ad3e3ee-5a43-4130-b448-ec77ec38e171'),(383,383,1,'Site','2023-02-08 06:23:37','2023-02-08 06:23:37','f582fcf0-0fb2-414c-b42b-8d481580030b'),(384,384,1,'Installer bg','2023-02-08 06:23:37','2023-02-08 06:23:37','e4f6eccf-28e9-410b-831b-999cffc8570a'),(385,385,1,'Install','2023-02-08 06:23:37','2023-02-08 06:23:37','4c088067-fc2e-407b-8d25-e227d1b00d93'),(386,386,1,'Prism','2023-02-08 06:23:37','2023-02-08 06:23:37','6d33542c-3e4d-4102-bd90-7d7342ee252b'),(387,387,1,'Jquery js LICENSE','2023-02-08 06:23:37','2023-02-08 06:23:37','241f0345-206b-4574-90b1-24e02dec5df0'),(388,388,1,'Jquery','2023-02-08 06:23:37','2023-02-08 06:23:37','abea0cbc-1305-43b7-ab2b-7c0392a04022'),(389,389,1,'Vue','2023-02-08 06:23:38','2023-02-08 06:23:38','c1eeeb29-7f88-4495-97e0-c53b9ed62f08'),(390,390,1,'Vue js LICENSE','2023-02-08 06:23:38','2023-02-08 06:23:38','a9bd27d4-13cc-4493-b135-a440ebcf3e61'),(391,391,1,'Manifest','2023-02-08 06:23:38','2023-02-08 06:23:38','09fba1e3-bc8d-4858-96fe-25d8b11093f3'),(392,392,1,'Queue manager','2023-02-08 06:23:38','2023-02-08 06:23:38','2ecac485-526b-4f34-bb43-1308917de622'),(393,393,1,'Queue manager js LICENSE','2023-02-08 06:23:38','2023-02-08 06:23:38','e9b4ae9b-17de-46d8-a829-a0bea868645d'),(394,394,1,'Utilities','2023-02-08 06:23:38','2023-02-08 06:23:38','ade58a6f-0f31-4cb0-a36a-66cd74e89cc5'),(395,395,1,'Craft Support Widget','2023-02-08 06:23:38','2023-02-08 06:23:38','f7b39141-b1f3-42af-b59f-39dbbf0a3cb1'),(396,396,1,'Craft partners','2023-02-08 06:23:38','2023-02-08 06:23:38','3615a253-a83c-49e4-8d88-d49f122b5ce8'),(397,397,1,'Craftquest','2023-02-08 06:23:38','2023-02-08 06:23:38','92589098-2385-4364-b97b-0f3de3d40757'),(398,398,1,'Discord','2023-02-08 06:23:38','2023-02-08 06:23:38','58469512-80c3-434b-baba-87041edd53b8'),(399,399,1,'Rami','2023-02-08 06:24:50','2023-02-08 06:24:50','4208d54b-af37-4674-9119-ac7d1304b20a'),(400,400,1,'Do research','2023-02-08 06:29:24','2023-02-08 06:29:24','857622bb-33bb-4ed6-8ce2-e2fdba04b075'),(401,401,1,'Rami','2023-02-08 06:31:39','2023-02-08 06:31:39','df1a655e-c1eb-462c-95d1-0563d953e8ce');
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2023-02-02 05:28:23','2023-02-02 05:28:23',NULL,NULL,'cdb3b2a1-cb8b-4271-bc6c-01ff3c34bcfd'),(2,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2023-02-08 03:29:22','2023-02-08 03:29:22',NULL,'2023-02-08 03:42:36','206237dd-705d-4fce-9fdc-abe55e4c51cf'),(3,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:43:59','2023-02-08 03:55:08',NULL,'2023-02-08 05:14:43','0231433c-6ac0-4eb3-b25f-77940aebdc9c'),(4,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:54:58','2023-02-08 03:54:58',NULL,'2023-02-08 05:14:43','00ef0d9e-f98f-464d-a5a4-eea2b9a4319c'),(5,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:54:58','2023-02-08 03:54:58',NULL,'2023-02-08 05:14:43','ac8a7786-5be9-44e3-8885-9b9e6c25b050'),(6,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:54:58','2023-02-08 03:54:58',NULL,'2023-02-08 05:14:43','cbd34237-a347-4e80-8778-a190be45c521'),(7,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:54:58','2023-02-08 03:54:58',NULL,'2023-02-08 05:14:43','79c4c05e-b83d-4557-af14-260369465050'),(8,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:54:58','2023-02-08 03:54:58',NULL,'2023-02-08 05:14:43','371799ff-ccc2-43c4-8059-5fc4f54dbe04'),(9,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:54:58','2023-02-08 03:54:58',NULL,'2023-02-08 05:14:43','334a3575-7d78-4127-a560-56e5e43ab1de'),(10,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:54:58','2023-02-08 03:54:58',NULL,'2023-02-08 05:14:43','3c016a6d-60b7-4c5b-aef9-5f6c45280a47'),(11,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:54:59','2023-02-08 03:54:59',NULL,'2023-02-08 05:14:43','9def2043-7572-499e-ac01-11e8200d05d1'),(12,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:54:59','2023-02-08 03:54:59',NULL,'2023-02-08 05:14:43','2182bda1-e34c-4526-b345-7c1ca9935701'),(13,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:54:59','2023-02-08 03:54:59',NULL,'2023-02-08 05:14:43','2c5b139b-bae1-427f-b8ae-903de7463cb8'),(14,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:54:59','2023-02-08 03:54:59',NULL,'2023-02-08 05:14:43','d46712be-4fef-4f7b-a0c1-ce1643848514'),(15,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:54:59','2023-02-08 03:54:59',NULL,'2023-02-08 05:14:43','c9681f44-b7cf-4583-9feb-dbe460c17c56'),(16,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:54:59','2023-02-08 03:54:59',NULL,'2023-02-08 05:14:43','ba1c9cd1-0e99-418d-8838-9eaa91180e12'),(17,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:54:59','2023-02-08 03:54:59',NULL,'2023-02-08 05:14:43','ff8caff9-a342-4353-bae6-454aed4536a2'),(18,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:54:59','2023-02-08 03:54:59',NULL,'2023-02-08 05:14:43','6e0b647d-ab77-459a-aafb-7ce4c9470e87'),(19,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:54:59','2023-02-08 03:54:59',NULL,'2023-02-08 05:14:43','fccd68ad-3ab9-4fef-a659-be418e7f56f0'),(20,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:54:59','2023-02-08 03:54:59',NULL,'2023-02-08 05:14:43','e5d76131-321d-49aa-8a64-879d73f43f19'),(21,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:54:59','2023-02-08 03:54:59',NULL,'2023-02-08 05:14:43','5fa3516f-3dea-4955-8d78-3893bd678487'),(22,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:54:59','2023-02-08 03:54:59',NULL,'2023-02-08 05:14:43','aebe88cd-86b8-45e1-a21a-e43bb841affe'),(23,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:54:59','2023-02-08 03:54:59',NULL,'2023-02-08 05:14:43','3a7787cb-ff3e-491e-ac69-b06a57848d25'),(24,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:54:59','2023-02-08 03:54:59',NULL,'2023-02-08 05:14:43','a51d2be4-b167-4b46-9776-8a5a77aeac94'),(25,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:54:59','2023-02-08 03:54:59',NULL,'2023-02-08 05:14:43','81460132-bc5a-486c-8e0c-08cef09d5ee0'),(26,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:54:59','2023-02-08 03:54:59',NULL,'2023-02-08 05:14:43','af25cc16-748f-4cad-ae8c-bf867bb921bb'),(27,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:54:59','2023-02-08 03:54:59',NULL,'2023-02-08 05:14:43','9604dd9d-b486-41a0-aaa7-1b8f0508b7b2'),(28,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:54:59','2023-02-08 03:54:59',NULL,'2023-02-08 05:14:43','bc551f1b-059d-4e10-9403-91313dde9617'),(29,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:54:59','2023-02-08 03:54:59',NULL,'2023-02-08 05:14:43','0afa5522-71e0-476f-8112-d6a083beb8ab'),(30,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:54:59','2023-02-08 03:54:59',NULL,'2023-02-08 05:14:43','216b1da4-6e7a-46a9-a7b1-823dbbdb4b56'),(31,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:54:59','2023-02-08 03:54:59',NULL,'2023-02-08 05:14:43','4f265209-b6fe-48f0-a02e-ee0f1af9556f'),(32,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:54:59','2023-02-08 03:54:59',NULL,'2023-02-08 05:14:43','555b6d6b-3df3-480b-bb0c-d2386e57fd1d'),(33,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:54:59','2023-02-08 03:54:59',NULL,'2023-02-08 05:14:43','daaec5e9-403c-46a9-be85-3a149ed7b7f0'),(34,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:54:59','2023-02-08 03:54:59',NULL,'2023-02-08 05:14:43','22671be1-4d09-4af8-a762-cf0a8f36491e'),(35,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:54:59','2023-02-08 03:54:59',NULL,'2023-02-08 05:14:43','6789cb64-0eb1-484a-95f5-f675ea188c70'),(36,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:00','2023-02-08 03:55:00',NULL,'2023-02-08 05:14:43','304b29f9-4320-469e-a590-52630c52daea'),(37,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:00','2023-02-08 03:55:00',NULL,'2023-02-08 05:14:43','64c86caf-08ea-4323-b50a-a2915ac38531'),(38,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:00','2023-02-08 03:55:00',NULL,'2023-02-08 05:14:43','f672c41c-885a-4893-8ed4-151440342c20'),(39,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:00','2023-02-08 03:55:00',NULL,'2023-02-08 05:14:43','6dcf62cf-56eb-498f-b0d2-a6369e9b3d60'),(40,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:00','2023-02-08 03:55:00',NULL,'2023-02-08 05:14:43','05af38a4-3d40-46f5-8598-ddd387cb47b5'),(41,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:00','2023-02-08 03:55:00',NULL,'2023-02-08 05:14:43','ee904e72-ccfd-49c0-99a4-7e0b39af8770'),(42,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:00','2023-02-08 03:55:00',NULL,'2023-02-08 05:14:43','43a3df58-cda9-43ca-97f8-e00ca680d727'),(43,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:00','2023-02-08 03:55:00',NULL,'2023-02-08 05:14:43','fc9ca6f8-47e4-43be-8c70-adafeed3cf97'),(44,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:00','2023-02-08 03:55:00',NULL,'2023-02-08 05:14:43','65b3c059-c94b-423b-9785-2ed787881a53'),(45,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:00','2023-02-08 03:55:00',NULL,'2023-02-08 05:14:43','90e62adf-62d4-44eb-b3ed-f7287c6872a3'),(46,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:00','2023-02-08 03:55:00',NULL,'2023-02-08 05:14:43','7be65d5c-7eae-47ed-942b-585ea349e833'),(47,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:00','2023-02-08 03:55:00',NULL,'2023-02-08 05:14:43','402079c8-c985-4a2b-9eca-e0c2e4d45b78'),(48,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:00','2023-02-08 03:55:00',NULL,'2023-02-08 05:14:43','7519124a-6172-4b2c-a25e-6391881829a5'),(49,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:00','2023-02-08 03:55:00',NULL,'2023-02-08 05:14:43','f42b5032-98aa-4fd3-8d2d-8ed49500e4ed'),(50,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:00','2023-02-08 03:55:00',NULL,'2023-02-08 05:14:43','2bce8297-2a8a-4db7-a0ee-323a8ed63bcd'),(51,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:00','2023-02-08 03:55:00',NULL,'2023-02-08 05:14:43','77f6bee6-af66-4b13-b947-4c3ccd0bed89'),(52,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:00','2023-02-08 03:55:00',NULL,'2023-02-08 05:14:43','6862da3f-a122-4d4d-9974-eac01eca5ba1'),(53,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:00','2023-02-08 03:55:00',NULL,'2023-02-08 05:14:43','ef142f15-9826-402b-bd0e-1f59ab4e5f9c'),(54,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:00','2023-02-08 03:55:00',NULL,'2023-02-08 05:14:43','3440ea6e-fe2f-461a-a6eb-c5af376d8fb6'),(55,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:00','2023-02-08 03:55:00',NULL,'2023-02-08 05:14:43','e7ff2609-f58e-48aa-848c-7a2103fa0abd'),(56,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:00','2023-02-08 03:55:00',NULL,'2023-02-08 05:14:43','048572ec-1de1-43c2-8041-5b6800cee5fb'),(57,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:00','2023-02-08 03:55:00',NULL,'2023-02-08 05:14:43','a0826acb-23eb-4351-82eb-3f214496dbd3'),(58,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:00','2023-02-08 03:55:00',NULL,'2023-02-08 05:14:43','2550aacf-b847-43df-af6f-a46678a64000'),(59,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:00','2023-02-08 03:55:00',NULL,'2023-02-08 05:14:43','d7002f62-9d26-48c1-a49f-9f42971857c5'),(60,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:00','2023-02-08 03:55:00',NULL,'2023-02-08 05:14:43','9ff216e7-04bf-48bf-a19f-5bb432876d76'),(61,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:00','2023-02-08 03:55:00',NULL,'2023-02-08 05:14:43','7757b59a-99b8-46c2-bc71-416a51940c1c'),(62,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:00','2023-02-08 03:55:00',NULL,'2023-02-08 05:14:43','5594bec5-9aed-48c2-bf6e-e12fa1947335'),(63,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:01','2023-02-08 03:55:01',NULL,'2023-02-08 05:14:43','3e70443d-61af-47c0-b21a-9e25810a0117'),(64,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:01','2023-02-08 03:55:01',NULL,'2023-02-08 05:14:43','28da78e8-5a02-453e-93b3-c2e3f32a9abe'),(65,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:01','2023-02-08 03:55:01',NULL,'2023-02-08 05:14:43','3048e290-7ec5-4fd7-bbd4-e91f9d8c190e'),(66,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:01','2023-02-08 03:55:01',NULL,'2023-02-08 05:14:43','a6086959-7324-4512-b596-206e432c9d63'),(67,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:01','2023-02-08 03:55:01',NULL,'2023-02-08 05:14:43','46be4595-47bf-4024-903c-05eb407f2f67'),(68,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:01','2023-02-08 03:55:01',NULL,'2023-02-08 05:14:43','570dffd1-f3cb-4d79-811e-2ae0a0920a9b'),(69,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:01','2023-02-08 03:55:01',NULL,'2023-02-08 05:14:43','e36f97b4-a95d-4ba1-a377-347c56744291'),(70,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:01','2023-02-08 03:55:01',NULL,'2023-02-08 05:14:43','9e475735-d3f9-414d-94e5-52b44f20f76a'),(71,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:01','2023-02-08 03:55:01',NULL,'2023-02-08 05:14:43','a2d1d08c-10c5-4553-8d9b-6a624cb26134'),(72,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:01','2023-02-08 03:55:01',NULL,'2023-02-08 05:14:43','49e0fccd-09d2-42dc-99c2-4c1f9fa812bb'),(73,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:01','2023-02-08 03:55:01',NULL,'2023-02-08 05:14:43','260943fd-0494-4d08-943d-8d8619523397'),(74,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:01','2023-02-08 03:55:01',NULL,'2023-02-08 05:14:43','5cdb2191-e426-4e13-80a8-24d2938fb653'),(75,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:01','2023-02-08 03:55:01',NULL,'2023-02-08 05:14:43','85386b3f-dac6-43c1-8b70-4cfa49c951a3'),(76,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:01','2023-02-08 03:55:01',NULL,'2023-02-08 05:14:43','54052979-6482-4648-8185-0007ac07b438'),(77,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:01','2023-02-08 03:55:01',NULL,'2023-02-08 05:14:43','0c60dab1-e024-4fb7-a47f-f7c051c9f5c5'),(78,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:01','2023-02-08 03:55:01',NULL,'2023-02-08 05:14:43','e909c262-505c-441b-89cf-53baadb7b6b0'),(79,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:01','2023-02-08 03:55:01',NULL,'2023-02-08 05:14:43','5864ede4-ea98-4b28-a2c3-5565fc7e26dd'),(80,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:01','2023-02-08 03:55:01',NULL,'2023-02-08 05:14:43','9f2220b5-19f8-4433-b392-e92274f7d132'),(81,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:01','2023-02-08 03:55:01',NULL,'2023-02-08 05:14:43','3cbf229d-97bf-42a7-8902-4d2bf706b9a7'),(82,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:01','2023-02-08 03:55:01',NULL,'2023-02-08 05:14:43','27a6aa5d-f428-41ea-acf3-6faa7a966ca6'),(83,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:01','2023-02-08 03:55:01',NULL,'2023-02-08 05:14:43','ceca3413-69b0-44bd-9f8c-59d959dc79b4'),(84,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:01','2023-02-08 03:55:01',NULL,'2023-02-08 05:14:43','783853cb-037b-44fc-a320-89f2235ccf6d'),(85,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:01','2023-02-08 03:55:01',NULL,'2023-02-08 05:14:43','f0da0c8d-11e1-490e-95f3-dbc03e5d3c4e'),(86,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:01','2023-02-08 03:55:01',NULL,'2023-02-08 05:14:43','15438814-4a36-4d4f-8650-b10a3f8f47dc'),(87,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:01','2023-02-08 03:55:01',NULL,'2023-02-08 05:14:43','8bc2e3ad-c9a5-43b6-b579-f5f231617434'),(88,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:01','2023-02-08 03:55:01',NULL,'2023-02-08 05:14:43','f839d88a-b5e8-4e19-a002-22c8a8d8eb14'),(89,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:02','2023-02-08 03:55:02',NULL,'2023-02-08 05:14:43','5ccdce72-97ed-4884-ba8a-da952145db7b'),(90,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:02','2023-02-08 03:55:02',NULL,'2023-02-08 05:14:43','e3675964-1c14-46fd-b62b-4d81d86d2edf'),(91,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:02','2023-02-08 03:55:02',NULL,'2023-02-08 05:14:43','144bc842-6709-4fce-ae1b-f688077314ef'),(92,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:02','2023-02-08 03:55:02',NULL,'2023-02-08 05:14:43','f2340dd7-d7a7-4bf5-9200-e6f3ebbfe396'),(93,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:02','2023-02-08 03:55:02',NULL,'2023-02-08 05:14:43','cf64a33d-c970-4af2-a882-04543f82b583'),(94,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:02','2023-02-08 03:55:02',NULL,'2023-02-08 05:14:43','127709b8-a668-430e-aafd-d454efcd456b'),(95,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:02','2023-02-08 03:55:02',NULL,'2023-02-08 05:14:43','500c3f10-ffe7-4365-89c6-a4d2f6b7de3b'),(96,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:02','2023-02-08 03:55:02',NULL,'2023-02-08 05:14:43','52ea4ed1-7ea9-4554-899d-32fbf083c909'),(97,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:02','2023-02-08 03:55:02',NULL,'2023-02-08 05:14:43','374ce3f0-4a26-45de-a526-b7413ea0d69e'),(98,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:02','2023-02-08 03:55:02',NULL,'2023-02-08 05:14:43','8e8efe48-63b7-45d0-a494-a1e5be5d03b4'),(99,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:02','2023-02-08 03:55:02',NULL,'2023-02-08 05:14:43','c77d9ab0-7176-42da-b151-5d06e58ba3ed'),(100,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:02','2023-02-08 03:55:02',NULL,'2023-02-08 05:14:43','be9add2e-7fda-4986-863f-40356c94c57d'),(101,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:02','2023-02-08 03:55:02',NULL,'2023-02-08 05:14:43','c8f274d1-7177-415f-9e23-50cb1dfd5402'),(102,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:02','2023-02-08 03:55:02',NULL,'2023-02-08 05:14:43','05a321ba-6156-4c2d-bea2-e3e27051421c'),(103,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:02','2023-02-08 03:55:02',NULL,'2023-02-08 05:14:43','822a08b5-a997-42d0-9217-5434e9124338'),(104,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:02','2023-02-08 03:55:02',NULL,'2023-02-08 05:14:43','346ef1e9-df87-44c2-a4d4-5bfc397792af'),(105,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:02','2023-02-08 03:55:02',NULL,'2023-02-08 05:14:43','73b1d767-c6f9-4016-962c-e40653efdc37'),(106,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:02','2023-02-08 03:55:02',NULL,'2023-02-08 05:14:43','b7d67aa3-3719-45d0-9f8a-eff284610daf'),(107,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:03','2023-02-08 03:55:03',NULL,'2023-02-08 05:14:43','eb883e91-3f52-49bd-bd27-d63fb91524f4'),(108,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:03','2023-02-08 03:55:03',NULL,'2023-02-08 05:14:43','ae3be621-cf57-4d72-ae9d-a16ee438cf79'),(109,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:03','2023-02-08 03:55:03',NULL,'2023-02-08 05:14:43','1f80f27f-1f84-43d4-84be-4673189fba8d'),(110,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:03','2023-02-08 03:55:03',NULL,'2023-02-08 05:14:43','c3e9a425-12cb-4daa-8e7b-369fc2c2cbf5'),(111,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:03','2023-02-08 03:55:03',NULL,'2023-02-08 05:14:43','3d14a57c-e48b-4c22-ad03-2ffe894f4733'),(112,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:03','2023-02-08 03:55:03',NULL,'2023-02-08 05:14:43','5cfe1a88-e984-4385-b63f-c4979476e6f2'),(113,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:03','2023-02-08 03:55:03',NULL,'2023-02-08 05:14:43','218cb28e-4496-4f7b-ad23-b553f4695362'),(114,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:03','2023-02-08 03:55:03',NULL,'2023-02-08 05:14:43','0cbe6d86-c361-4e55-91ab-04b56091cbc2'),(115,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:03','2023-02-08 03:55:03',NULL,'2023-02-08 05:14:43','ef03cd0d-90fb-45ba-9fbf-d73bfb2e935a'),(116,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:03','2023-02-08 03:55:03',NULL,'2023-02-08 05:14:43','da6d5827-4ba2-4129-9ae8-3cdf55a90185'),(117,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:03','2023-02-08 03:55:03',NULL,'2023-02-08 05:14:43','5647263c-207d-4c2c-9d3c-defa504357c7'),(118,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:03','2023-02-08 03:55:03',NULL,'2023-02-08 05:14:43','449b8d0c-b1da-4487-828b-b40f19e6afdd'),(119,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:04','2023-02-08 03:55:04',NULL,'2023-02-08 05:14:43','f5ee7b2e-af0f-4ec7-93c0-0bd4fd4163a0'),(120,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:04','2023-02-08 03:55:04',NULL,'2023-02-08 05:14:43','34f0985a-b138-41b2-ae3a-6519766352bf'),(121,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:04','2023-02-08 03:55:04',NULL,'2023-02-08 05:14:43','58879b56-fe49-4e32-88cf-0443e03d8308'),(122,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:04','2023-02-08 03:55:04',NULL,'2023-02-08 05:14:43','03745ef5-e6f0-4182-a1c4-bf0a05ea1e45'),(123,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:04','2023-02-08 03:55:04',NULL,'2023-02-08 05:14:43','30e5fbb3-dd44-4bca-a8d8-d2287b15aedd'),(124,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:04','2023-02-08 03:55:04',NULL,'2023-02-08 05:14:43','2c5def61-a57c-4e0e-9e50-ea4b194a884e'),(125,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:04','2023-02-08 03:55:04',NULL,'2023-02-08 05:14:43','219da968-ecbf-4822-af98-4662c74d4c01'),(126,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:04','2023-02-08 03:55:04',NULL,'2023-02-08 05:14:43','ac8b9659-828f-463e-b1bd-763f0c8858ab'),(127,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:04','2023-02-08 03:55:04',NULL,'2023-02-08 05:14:43','0c5408bc-9f93-407f-b273-5d00c8958701'),(128,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:04','2023-02-08 03:55:04',NULL,'2023-02-08 05:14:43','fc5aec3d-daa6-48f3-b25d-9cc9d8e67e33'),(129,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:04','2023-02-08 03:55:04',NULL,'2023-02-08 05:14:43','704d143d-54a6-4076-816a-d83de3d756d7'),(130,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:04','2023-02-08 03:55:04',NULL,'2023-02-08 05:14:43','531d9f5f-0876-4ef8-80e1-9677423a6348'),(131,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:04','2023-02-08 03:55:04',NULL,'2023-02-08 05:14:43','2dc0f1f9-e14c-4f4f-b42d-484bf0f5f29e'),(132,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:04','2023-02-08 03:55:04',NULL,'2023-02-08 05:14:43','05986937-4d71-4a27-aced-bc56b441b150'),(133,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:04','2023-02-08 03:55:04',NULL,'2023-02-08 05:14:43','f667a235-4b17-4549-add6-995d70024112'),(134,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:04','2023-02-08 03:55:04',NULL,'2023-02-08 05:14:43','dec6175c-25c9-41f7-a831-91aad5f1ee2b'),(135,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:04','2023-02-08 03:55:04',NULL,'2023-02-08 05:14:43','8abcd92a-9e31-4ca1-a48a-39552fab40dc'),(136,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:04','2023-02-08 03:55:04',NULL,'2023-02-08 05:14:43','986a839c-bedc-4444-9cdb-d5cf6d972a54'),(137,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:04','2023-02-08 03:55:04',NULL,'2023-02-08 05:14:43','5bf1ad49-8a45-4f95-b77d-af7eb3dcd528'),(138,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:04','2023-02-08 03:55:04',NULL,'2023-02-08 05:14:43','78912f70-ed52-4bcc-9ead-570251a0a413'),(139,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:04','2023-02-08 03:55:04',NULL,'2023-02-08 05:14:43','21027689-a0d9-43bb-9617-fe5fc0a90c31'),(140,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:04','2023-02-08 03:55:04',NULL,'2023-02-08 05:14:43','47dd08e3-1149-4a90-8fde-b4a775f919fc'),(141,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:05','2023-02-08 03:55:05',NULL,'2023-02-08 05:14:43','70784cdf-4c67-4084-a08e-fec8fd88375d'),(142,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:05','2023-02-08 03:55:05',NULL,'2023-02-08 05:14:43','fc73ebb0-6ab0-43b5-9a23-e26be9a8137f'),(143,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:05','2023-02-08 03:55:05',NULL,'2023-02-08 05:14:43','262b4aac-330b-4d88-a36d-e33c84ed36e2'),(144,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:05','2023-02-08 03:55:05',NULL,'2023-02-08 05:14:43','bcbe1f0e-1843-40e2-88f0-169c7b15a036'),(145,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:05','2023-02-08 03:55:05',NULL,'2023-02-08 05:14:43','4c9e7a35-d781-4d8d-a7d7-9116ecbe3b5a'),(146,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:05','2023-02-08 03:55:05',NULL,'2023-02-08 05:14:43','9ee972f2-6c61-4026-9c36-5f5cc58feed7'),(147,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:05','2023-02-08 03:55:05',NULL,'2023-02-08 05:14:43','74a22ffa-3bbb-4cbc-8c8b-0e6c586982b5'),(148,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:05','2023-02-08 03:55:05',NULL,'2023-02-08 05:14:43','a9b29bc3-3d72-4808-9603-f23b9165275a'),(149,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:05','2023-02-08 03:55:05',NULL,'2023-02-08 05:14:43','01c0f08a-7a26-4639-9e41-78be96eddf71'),(150,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:05','2023-02-08 03:55:05',NULL,'2023-02-08 05:14:43','8a587044-51e4-4b2e-a966-ac9802c94073'),(151,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:05','2023-02-08 03:55:05',NULL,'2023-02-08 05:14:43','e7446987-37b1-4d87-a4f7-ac220b6a86a3'),(152,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:05','2023-02-08 03:55:05',NULL,'2023-02-08 05:14:43','a689b2d1-aada-4ee3-bb78-696e63d537bf'),(153,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:05','2023-02-08 03:55:05',NULL,'2023-02-08 05:14:43','1bc9fd39-3e5e-46c1-bb4c-5aed67596d54'),(154,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:05','2023-02-08 03:55:05',NULL,'2023-02-08 05:14:43','7c3933e2-6cea-4edb-b9a8-dd0800fc1e0b'),(155,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:05','2023-02-08 03:55:05',NULL,'2023-02-08 05:14:43','a5e23e17-2f29-4bdc-9364-17fa9dd4e984'),(156,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:05','2023-02-08 03:55:05',NULL,'2023-02-08 05:14:43','33d8b08d-8f41-4f2b-89da-b408e05a8db5'),(157,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:05','2023-02-08 03:55:05',NULL,'2023-02-08 05:14:43','c5eadd59-9005-4180-8028-ec12c27c3946'),(158,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:05','2023-02-08 03:55:05',NULL,'2023-02-08 05:14:43','700fb27c-f547-4833-a1e7-51d3fd20e525'),(159,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:05','2023-02-08 03:55:05',NULL,'2023-02-08 05:14:43','8c949545-45c2-48f1-bb0b-f8610994beb0'),(160,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:05','2023-02-08 03:55:05',NULL,'2023-02-08 05:14:43','8e37e9b8-ed1a-4ea3-b644-0300fad81476'),(161,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:05','2023-02-08 03:55:05',NULL,'2023-02-08 05:14:43','55d7dcd0-9908-4558-a518-26136e50addf'),(162,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:05','2023-02-08 03:55:05',NULL,'2023-02-08 05:14:43','68e8a84d-38a2-4862-8401-7e62462be85d'),(163,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:05','2023-02-08 03:55:05',NULL,'2023-02-08 05:14:43','996a8829-07f4-4a26-909b-5bf1868d196d'),(164,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:05','2023-02-08 03:55:05',NULL,'2023-02-08 05:14:43','c2d77b1e-18e3-44b7-b758-629e30650194'),(165,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:05','2023-02-08 03:55:05',NULL,'2023-02-08 05:14:43','c216232f-3e22-4bd8-9de2-3f0e3b03e403'),(166,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:05','2023-02-08 03:55:05',NULL,'2023-02-08 05:14:43','4d28355c-f6ee-4d7f-8fe0-23536581f226'),(167,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:06','2023-02-08 03:55:06',NULL,'2023-02-08 05:14:43','cb0f80fd-a1ad-49a6-a5de-2cbdae6dbf0d'),(168,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:06','2023-02-08 03:55:06',NULL,'2023-02-08 05:14:43','5f91a797-2596-41b1-8877-a89644d07853'),(169,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:06','2023-02-08 03:55:06',NULL,'2023-02-08 05:14:43','a6700fc5-9a78-4967-9c89-977f9e898580'),(170,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:06','2023-02-08 03:55:06',NULL,'2023-02-08 05:14:43','9bef20a5-7e5c-41c0-93b2-135362be2d8a'),(171,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:06','2023-02-08 03:55:06',NULL,'2023-02-08 05:14:43','e9e6774d-1cdf-4f1f-9f74-559ab08982e9'),(172,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:06','2023-02-08 03:55:06',NULL,'2023-02-08 05:14:43','13200254-e854-4df3-ac19-980342affece'),(173,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:06','2023-02-08 03:55:06',NULL,'2023-02-08 05:14:43','84a3c1ca-5386-4973-8f24-1794bd6bc20f'),(174,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:06','2023-02-08 03:55:06',NULL,'2023-02-08 05:14:43','2eca9f93-b6e0-4746-b795-1ad14f5f4ccc'),(175,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:06','2023-02-08 03:55:06',NULL,'2023-02-08 05:14:43','b63347f0-9ea5-48f4-ab1a-3ce2e9ad4c50'),(176,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:06','2023-02-08 03:55:06',NULL,'2023-02-08 05:14:43','e3286fe9-eca7-4dff-8a67-8c796499be40'),(177,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:06','2023-02-08 03:55:06',NULL,'2023-02-08 05:14:43','bd8bf961-4990-4e64-a13e-f7098f31406c'),(178,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:06','2023-02-08 03:55:06',NULL,'2023-02-08 05:14:43','95982b16-cd7a-4c45-8449-4e17f7c6ff64'),(179,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:06','2023-02-08 03:55:06',NULL,'2023-02-08 05:14:43','7daf00c5-e909-493e-882a-9d9fa82e6a31'),(180,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:06','2023-02-08 03:55:06',NULL,'2023-02-08 05:14:43','5a41be93-55ed-4457-994d-b8d122bc1570'),(181,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:06','2023-02-08 03:55:06',NULL,'2023-02-08 05:14:43','d3caddc5-6eb2-48b1-91b3-4e8a80b9bdcf'),(182,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:07','2023-02-08 03:55:07',NULL,'2023-02-08 05:14:43','f4b906a9-ce62-4ef5-aa46-15060fe45d9a'),(183,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:07','2023-02-08 03:55:07',NULL,'2023-02-08 05:14:43','3af63928-67b6-4441-b4df-f383634055b4'),(184,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:07','2023-02-08 03:55:07',NULL,'2023-02-08 05:14:43','fb529edd-5130-4084-a49b-23459548218a'),(185,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:07','2023-02-08 03:55:07',NULL,'2023-02-08 05:14:43','bb5d5ef1-846d-4539-8182-f32f6e386cf2'),(186,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:07','2023-02-08 03:55:07',NULL,'2023-02-08 05:14:43','3cee7f4d-d954-4fa0-9b80-00356082ceae'),(187,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:07','2023-02-08 03:55:07',NULL,'2023-02-08 05:14:43','0c84e591-3c32-4671-8489-032e4ddd84b9'),(188,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:07','2023-02-08 03:55:07',NULL,'2023-02-08 05:14:43','df947541-bbf1-46a6-8b7a-d10740996c55'),(189,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:07','2023-02-08 03:55:07',NULL,'2023-02-08 05:14:43','fa08d796-dc78-4d46-86fc-e4ce11cd52dd'),(190,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:07','2023-02-08 03:55:07',NULL,'2023-02-08 05:14:43','0b6c2566-5137-4d5e-895d-9c2a5ce4760e'),(191,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:07','2023-02-08 03:55:07',NULL,'2023-02-08 05:14:43','4d730447-140e-49d2-aa95-c15ba7b7424b'),(192,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:07','2023-02-08 03:55:07',NULL,'2023-02-08 05:14:43','48e6cf45-dd8e-4e14-b32e-b949f7d0a551'),(193,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:08','2023-02-08 03:55:08',NULL,'2023-02-08 05:14:43','9af8f104-1eaf-4dfa-a01a-7ab01d1abe33'),(194,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:08','2023-02-08 03:55:08',NULL,'2023-02-08 05:14:43','56cddc70-b554-4395-9bff-42035d2512aa'),(195,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:08','2023-02-08 03:55:08',NULL,'2023-02-08 05:14:43','59418cb8-f4de-4fdc-ac21-7e68da767b5b'),(196,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:08','2023-02-08 03:55:08',NULL,'2023-02-08 05:14:43','8eb02a91-8fba-44f4-a1e3-0cd5dfb8e4b2'),(197,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:08','2023-02-08 03:55:08',NULL,'2023-02-08 05:14:43','d402a0cd-ed17-484e-a340-215d0a7a2b38'),(198,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:08','2023-02-08 03:55:08',NULL,'2023-02-08 05:14:43','e23e1484-4b74-4498-8996-5e6e8c7f6f6a'),(199,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:08','2023-02-08 03:55:08',NULL,'2023-02-08 05:14:43','5557e9f1-7c14-4fc4-a165-d3187e5230dc'),(200,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-02-08 03:55:08','2023-02-08 03:55:08',NULL,'2023-02-08 05:14:43','6c42d8b3-2f84-47d4-9aad-b2781d851abe'),(201,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:12:08','2023-02-08 06:23:38',NULL,'2023-02-08 06:29:19','8b2ee2d2-ac29-42c2-9e6e-56f7fb3d0aad'),(202,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:29','2023-02-08 06:23:29',NULL,'2023-02-08 14:19:31','beb120ee-88b5-4f31-9c2c-0a46297fc1df'),(203,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:29','2023-02-08 06:23:29',NULL,'2023-02-08 14:19:31','5e0c2b50-d6c4-4b0f-afec-18367ae8cb33'),(204,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:29','2023-02-08 06:23:29',NULL,'2023-02-08 14:19:31','291fc113-66b6-4411-8eac-b980b8b5dcda'),(205,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:29','2023-02-08 06:23:29',NULL,'2023-02-08 14:19:31','a20821bc-55d9-4a74-9519-a91435bcf278'),(206,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:29','2023-02-08 06:23:29',NULL,'2023-02-08 14:19:31','21eaa8b3-6979-442a-aa80-5fa29203b880'),(207,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:29','2023-02-08 06:23:29',NULL,'2023-02-08 14:19:31','0444a402-6775-4473-b439-a32ad7b1506b'),(208,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:29','2023-02-08 06:23:29',NULL,'2023-02-08 14:19:31','e7e88b16-6991-4ac7-9fc9-faefd4146867'),(209,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:29','2023-02-08 06:23:29',NULL,'2023-02-08 14:19:31','05eaa8fd-8aea-43f0-85f8-7210890a07ce'),(210,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:29','2023-02-08 06:23:29',NULL,'2023-02-08 14:19:31','8bd63950-ccd2-45f3-ac04-fd1929f83c71'),(211,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:29','2023-02-08 06:23:29',NULL,'2023-02-08 14:19:31','b3406fcc-991f-499c-8968-5dedd9014dd9'),(212,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:29','2023-02-08 06:23:29',NULL,'2023-02-08 14:19:31','2e30b9b2-c95f-4c8f-aca1-5a56209ace54'),(213,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:29','2023-02-08 06:23:29',NULL,'2023-02-08 14:19:31','d3206d5a-d485-4c9d-adce-9f2cf598ba86'),(214,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:29','2023-02-08 06:23:29',NULL,'2023-02-08 14:19:31','e7d0422e-6afd-469d-a4cd-b28fc0db8e9a'),(215,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:29','2023-02-08 06:23:29',NULL,'2023-02-08 14:19:31','acc8ab1a-fbf7-4fd1-9a13-8c89de41c09a'),(216,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:29','2023-02-08 06:23:29',NULL,'2023-02-08 14:19:31','f57e9655-4db0-475a-8faf-3509a7bb638a'),(217,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:29','2023-02-08 06:23:29',NULL,'2023-02-08 14:19:31','2b3e1728-919b-40b4-8bfb-09df44ec47c3'),(218,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:29','2023-02-08 06:23:29',NULL,'2023-02-08 14:19:31','2e8657db-913a-4cc3-ba60-b2886ecb7bb3'),(219,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:30','2023-02-08 06:23:30',NULL,'2023-02-08 14:19:31','2ac2d201-02cd-48d7-a648-ac6cc8357cdd'),(220,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:30','2023-02-08 06:23:30',NULL,'2023-02-08 14:19:31','bb9a0d94-7a05-4681-a7c4-f0abb5290b51'),(221,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:30','2023-02-08 06:23:30',NULL,'2023-02-08 14:19:31','39cf3db8-e937-4537-a17d-0d8550286a67'),(222,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:30','2023-02-08 06:23:30',NULL,'2023-02-08 14:19:31','c8d3b2a2-ffa0-4a8d-8923-213b391d0a6f'),(223,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:30','2023-02-08 06:23:30',NULL,'2023-02-08 14:19:31','901f77f3-9605-4c0a-bf62-2432c93ff8e7'),(224,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:30','2023-02-08 06:23:30',NULL,'2023-02-08 14:19:31','911fbeb8-94f8-4b6a-bd4a-bd60ab8594c7'),(225,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:30','2023-02-08 06:23:30',NULL,'2023-02-08 14:19:31','05d271a2-58d2-472c-891b-28ccdcffc95e'),(226,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:30','2023-02-08 06:23:30',NULL,'2023-02-08 14:19:31','d572de47-1f6c-4caa-93ca-ccb66e9843cf'),(227,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:30','2023-02-08 06:23:30',NULL,'2023-02-08 14:19:31','80685c34-cc38-4f5e-a524-b66362e9289b'),(228,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:30','2023-02-08 06:23:30',NULL,'2023-02-08 14:19:31','8d8dcc98-f2f3-4c85-852b-9a9d474c671e'),(229,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:30','2023-02-08 06:23:30',NULL,'2023-02-08 14:19:31','cedbc944-0763-4d1f-91a0-370ed1471b5e'),(230,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:30','2023-02-08 06:23:30',NULL,'2023-02-08 14:19:31','33cd6578-d6d0-40b9-92f2-bda006e86694'),(231,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:30','2023-02-08 06:23:30',NULL,'2023-02-08 14:19:31','e2630021-1018-4a7a-9997-39dfa97c71c2'),(232,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:30','2023-02-08 06:23:30',NULL,'2023-02-08 14:19:31','8f6912a1-a060-458a-8699-c66d725d8fed'),(233,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:30','2023-02-08 06:23:30',NULL,'2023-02-08 14:19:31','19464da5-9042-465e-802a-4d73f36c6da6'),(234,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:30','2023-02-08 06:23:30',NULL,'2023-02-08 14:19:31','8ea7bc6d-acf0-479d-83a0-9c94c70f5fda'),(235,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:30','2023-02-08 06:23:30',NULL,'2023-02-08 14:19:31','e1ffa7a3-9b43-444e-99c8-5061dd01518b'),(236,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:30','2023-02-08 06:23:30',NULL,'2023-02-08 14:19:31','468280be-77df-4733-b701-3fca73fd4401'),(237,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:30','2023-02-08 06:23:30',NULL,'2023-02-08 14:19:31','a4953b23-d025-402d-bdd6-da60669e502b'),(238,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:30','2023-02-08 06:23:30',NULL,'2023-02-08 14:19:31','7c85c52c-42ee-4963-98b5-431ca16514f1'),(239,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:30','2023-02-08 06:23:30',NULL,'2023-02-08 14:19:31','e7ded3dc-fd7a-4d57-a354-c7de3e522ca1'),(240,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:30','2023-02-08 06:23:30',NULL,'2023-02-08 14:19:31','54a55aac-5243-487c-9e5e-f35fb8df4be6'),(241,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:30','2023-02-08 06:23:30',NULL,'2023-02-08 14:19:31','376590f3-ae0e-4cb8-a434-94ce0fd7d3cf'),(242,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:30','2023-02-08 06:23:30',NULL,'2023-02-08 14:19:31','377c5a1b-0a3c-4429-938c-89711ea1c679'),(243,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:30','2023-02-08 06:23:30',NULL,'2023-02-08 14:19:31','7ad209bb-2065-40ba-a5ab-b08c9886e76a'),(244,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:30','2023-02-08 06:23:30',NULL,'2023-02-08 14:19:31','3ea7ab75-cb74-488f-928f-5232e0015a83'),(245,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:30','2023-02-08 06:23:30',NULL,'2023-02-08 14:19:31','ff439a6a-879e-42c9-8c37-1e7b74ddd7e6'),(246,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:30','2023-02-08 06:23:30',NULL,'2023-02-08 14:19:31','be220919-0c71-41bf-b647-2fcaeaaf6b55'),(247,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:31','2023-02-08 06:23:31',NULL,'2023-02-08 14:19:31','c9c0d87a-6ad9-4f02-b116-322d0fb352e7'),(248,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:31','2023-02-08 06:23:31',NULL,'2023-02-08 14:19:31','12cec656-fffe-4688-af7b-c385a895b79c'),(249,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:31','2023-02-08 06:23:31',NULL,'2023-02-08 14:19:31','00662ff3-aecf-4bc9-a9ac-474b9a34d7ea'),(250,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:31','2023-02-08 06:23:31',NULL,'2023-02-08 14:19:31','a584dc3d-4f7f-4946-8fa7-34e5a42209cc'),(251,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:31','2023-02-08 06:23:31',NULL,'2023-02-08 14:19:31','ca71591b-e93b-4a83-9e66-0290055c6590'),(252,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:31','2023-02-08 06:23:31',NULL,'2023-02-08 14:19:31','e0e5f83f-9e05-4054-8bd0-317625200201'),(253,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:31','2023-02-08 06:23:31',NULL,'2023-02-08 14:19:31','56fd8e27-ef4e-4ae6-97e9-4758e8ca76f0'),(254,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:31','2023-02-08 06:23:31',NULL,'2023-02-08 14:19:31','6e3b03ee-9d08-4f04-bcab-eaa361f83322'),(255,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:31','2023-02-08 06:23:31',NULL,'2023-02-08 14:19:31','08312b91-690c-490b-a8b6-bdc90c321376'),(256,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:31','2023-02-08 06:23:31',NULL,'2023-02-08 14:19:31','806ed263-7964-4a52-b4e3-fbe216c499d4'),(257,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:31','2023-02-08 06:23:31',NULL,'2023-02-08 14:19:31','c3bb6cef-d611-41f0-9288-80634a59d9d1'),(258,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:31','2023-02-08 06:23:31',NULL,'2023-02-08 14:19:31','9aeefe42-28bc-4efc-97c8-3f08b25eefa9'),(259,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:31','2023-02-08 06:23:31',NULL,'2023-02-08 14:19:31','6187e0a2-a1b8-4966-b976-4e8154882f63'),(260,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:31','2023-02-08 06:23:31',NULL,'2023-02-08 14:19:31','2630e8f5-c53a-4f78-a0a9-21e3fe35746e'),(261,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:31','2023-02-08 06:23:31',NULL,'2023-02-08 14:19:31','cef4b6e0-403e-493b-9b1d-98e9fa9052ec'),(262,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:31','2023-02-08 06:23:31',NULL,'2023-02-08 14:19:31','7d661413-4557-4de2-8a51-81b3f33b56b2'),(263,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:31','2023-02-08 06:23:31',NULL,'2023-02-08 14:19:31','8398c8f4-7f46-4ead-ad67-6d8ff28915ff'),(264,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:31','2023-02-08 06:23:31',NULL,'2023-02-08 14:19:31','632ae1eb-7fd9-4cc9-ba37-468d100a7cbe'),(265,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:31','2023-02-08 06:23:31',NULL,'2023-02-08 14:19:31','febab159-a3bb-42a5-9b6a-3fff0af22e5d'),(266,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:31','2023-02-08 06:23:31',NULL,'2023-02-08 14:19:31','f825ede7-2481-4afa-b5db-ad7bc5714f43'),(267,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:31','2023-02-08 06:23:31',NULL,'2023-02-08 14:19:31','7bc8c961-ad36-4b8a-80e2-d5a404208ba3'),(268,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:31','2023-02-08 06:23:31',NULL,'2023-02-08 14:19:31','b30ad556-f930-46e1-a5ea-2f3980c0fdbc'),(269,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:31','2023-02-08 06:23:31',NULL,'2023-02-08 14:19:31','c45d48e8-355b-4044-9f4d-643aa8dd22d9'),(270,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:31','2023-02-08 06:23:31',NULL,'2023-02-08 14:19:31','47ec447e-c618-4983-83ad-bae56176ad46'),(271,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:31','2023-02-08 06:23:31',NULL,'2023-02-08 14:19:31','be4a4aa6-a004-4c19-b2ce-29e4d5105fc0'),(272,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:31','2023-02-08 06:23:31',NULL,'2023-02-08 14:19:31','1a53bc08-6545-4d3e-8add-c31a440f7651'),(273,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:31','2023-02-08 06:23:31',NULL,'2023-02-08 14:19:31','8bba5a06-6bc7-45ca-9d58-a92b5466a1a1'),(274,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:32','2023-02-08 06:23:32',NULL,'2023-02-08 14:19:30','8e72a10a-acff-4673-96fe-8bac88d8ff5d'),(275,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:32','2023-02-08 06:23:32',NULL,'2023-02-08 14:19:30','687ad826-b52f-481d-99ca-db73f18f329a'),(276,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:32','2023-02-08 06:23:32',NULL,'2023-02-08 14:19:30','543e9bbe-31b9-4513-825c-03e2a91fb89d'),(277,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:32','2023-02-08 06:23:32',NULL,'2023-02-08 14:19:30','664a60c2-f8ad-47eb-bc1a-4d2cd71a26a6'),(278,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:32','2023-02-08 06:23:32',NULL,'2023-02-08 14:19:30','1ed61c9f-d62d-4e05-9202-3af37cda61ce'),(279,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:32','2023-02-08 06:23:32',NULL,'2023-02-08 14:19:30','d1a9eeb6-6f3a-4bfc-9072-4597456b50ea'),(280,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:32','2023-02-08 06:23:32',NULL,'2023-02-08 14:19:30','9df87dae-3bc4-4a90-83e9-3a35f0daed52'),(281,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:32','2023-02-08 06:23:32',NULL,'2023-02-08 14:19:31','3ee65a8b-97f0-4e12-9ff5-d8a81bb95230'),(282,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:32','2023-02-08 06:23:32',NULL,'2023-02-08 14:19:31','94709ffb-2b2d-4583-88b5-0c8504b04cb6'),(283,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:32','2023-02-08 06:23:32',NULL,'2023-02-08 14:19:31','38d0362c-59f0-4162-8f39-aaa0489878ec'),(284,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:32','2023-02-08 06:23:32',NULL,'2023-02-08 14:19:31','7fa9b688-031a-4955-a876-03b666f3c0cd'),(285,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:32','2023-02-08 06:23:32',NULL,'2023-02-08 14:19:31','973f970c-4146-4840-9ddc-0011e47edfc1'),(286,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:32','2023-02-08 06:23:32',NULL,'2023-02-08 14:19:31','666e273a-ed61-47a9-acc4-632c1214c698'),(287,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:32','2023-02-08 06:23:32',NULL,'2023-02-08 14:19:31','2a5fe059-bcdf-4116-a38a-a08971704e92'),(288,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:32','2023-02-08 06:23:32',NULL,'2023-02-08 14:19:31','61b776d2-6366-4d85-aaf5-7f99808dfb04'),(289,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:32','2023-02-08 06:23:32',NULL,'2023-02-08 14:19:31','1a7b45ab-0079-48cd-a04a-ad758a4fcd8e'),(290,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:32','2023-02-08 06:23:32',NULL,'2023-02-08 14:19:31','dda3a29f-3ab6-4565-a08f-f6e4530103d9'),(291,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:32','2023-02-08 06:23:32',NULL,'2023-02-08 14:19:31','4723b78c-b477-4c2c-8757-23b6bf1ff56c'),(292,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:32','2023-02-08 06:23:32',NULL,'2023-02-08 14:19:31','4149ce20-8ae7-45ef-a33e-627550a672d8'),(293,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:32','2023-02-08 06:23:32',NULL,'2023-02-08 14:19:31','e7b25d2d-9941-4775-8c76-c689e3375785'),(294,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:32','2023-02-08 06:23:32',NULL,'2023-02-08 14:19:31','f0600bbd-3cd4-4d80-afa5-a163c1ea59ed'),(295,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:32','2023-02-08 06:23:32',NULL,'2023-02-08 14:19:31','a20394cb-fd92-4918-970d-b32ed92407e8'),(296,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:32','2023-02-08 06:23:32',NULL,'2023-02-08 14:19:31','0e9f55b4-f06e-431f-a82a-555666780cb7'),(297,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:32','2023-02-08 06:23:32',NULL,'2023-02-08 14:19:31','91b634ff-0495-49f2-a0b4-b2bd363def25'),(298,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:33','2023-02-08 06:23:33',NULL,'2023-02-08 14:19:30','35c504c3-5b2e-4bc6-b416-bc429928e4f6'),(299,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:33','2023-02-08 06:23:33',NULL,'2023-02-08 14:19:30','d656860b-c88e-47c5-a1ec-6a8b41add196'),(300,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:33','2023-02-08 06:23:33',NULL,'2023-02-08 14:19:30','4aa85d6c-dae3-4c24-aefc-f711d9ec6929'),(301,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:33','2023-02-08 06:23:33',NULL,'2023-02-08 14:19:30','e6cd8964-90b4-4e9d-a0df-3ef8fbc9343a'),(302,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:33','2023-02-08 06:23:33',NULL,'2023-02-08 14:19:30','3c342efc-82e7-4f67-85b5-56c09f151c3a'),(303,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:33','2023-02-08 06:23:33',NULL,'2023-02-08 14:19:30','6529b87c-51a0-478a-a944-c1bd337f054e'),(304,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:33','2023-02-08 06:23:33',NULL,'2023-02-08 14:19:30','a33b9111-ba2a-4555-afce-93058e4c227c'),(305,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:33','2023-02-08 06:23:33',NULL,'2023-02-08 14:19:30','5214fecf-8f30-4279-8411-75b9f3ac8229'),(306,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:33','2023-02-08 06:23:33',NULL,'2023-02-08 14:19:30','ac31038a-a8d1-454f-861f-fee01c1a0265'),(307,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:33','2023-02-08 06:23:33',NULL,'2023-02-08 14:19:30','cc54ce4f-ac07-49fb-907b-55ee6351fc65'),(308,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:33','2023-02-08 06:23:33',NULL,'2023-02-08 14:19:30','267eabe0-d223-42bc-83d2-b5b86237b894'),(309,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:33','2023-02-08 06:23:33',NULL,'2023-02-08 14:19:30','7ceaa3ec-f034-4b41-9fff-1a2444f63cd0'),(310,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:33','2023-02-08 06:23:33',NULL,'2023-02-08 14:19:30','7f2d5962-fc07-474b-bb3a-81c0cbfa70d1'),(311,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:34','2023-02-08 06:23:34',NULL,'2023-02-08 14:19:30','0ae39f49-b216-4e31-a9ef-14e00d682a39'),(312,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:34','2023-02-08 06:23:34',NULL,'2023-02-08 14:19:30','b87fd58e-8552-483b-ab93-4229c9018fbd'),(313,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:34','2023-02-08 06:23:34',NULL,'2023-02-08 14:19:30','f5b7d624-5690-43db-9e75-760a9649358c'),(314,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:34','2023-02-08 06:23:34',NULL,'2023-02-08 14:19:30','9556e4c0-3957-4bb2-8464-586877eb65aa'),(315,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:34','2023-02-08 06:23:34',NULL,'2023-02-08 14:19:30','8988a349-4ebb-4008-bcb3-f375702d0d0d'),(316,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:34','2023-02-08 06:23:34',NULL,'2023-02-08 14:19:30','147852a2-8fe5-43ac-a073-27dfe849236a'),(317,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:34','2023-02-08 06:23:34',NULL,'2023-02-08 14:19:30','ef581ec3-5024-4338-aa87-b00b25af8096'),(318,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:34','2023-02-08 06:23:34',NULL,'2023-02-08 14:19:30','e44cc2f5-4388-4edb-8a90-21c1efe28bf2'),(319,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:34','2023-02-08 06:23:34',NULL,'2023-02-08 14:19:30','5ed24e67-dedf-4d59-a70f-80bb5a1d56ea'),(320,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:34','2023-02-08 06:23:34',NULL,'2023-02-08 14:19:30','a730c614-1e57-465e-87b0-93baa8aecc16'),(321,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:34','2023-02-08 06:23:34',NULL,'2023-02-08 14:19:30','7c1b9a12-91d4-4bd0-9dee-68c7993055f7'),(322,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:34','2023-02-08 06:23:34',NULL,'2023-02-08 14:19:30','bd271210-5168-454d-834d-ec1051f8917e'),(323,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:34','2023-02-08 06:23:34',NULL,'2023-02-08 14:19:30','10f920cc-7e95-414c-907a-6c284dc4f0dd'),(324,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:34','2023-02-08 06:23:34',NULL,'2023-02-08 14:19:30','6399611e-2913-4384-9a7b-d0ce7a88a2fb'),(325,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:34','2023-02-08 06:23:34',NULL,'2023-02-08 14:19:30','77fa7d6e-24ac-4db4-8fa6-156932323aee'),(326,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:34','2023-02-08 06:23:34',NULL,'2023-02-08 14:19:30','4952d21b-ceb6-45f4-a788-b0f0789213b2'),(327,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:34','2023-02-08 06:23:34',NULL,'2023-02-08 14:19:30','af6e89b0-2b61-4b94-8b60-48a98b4760bf'),(328,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:34','2023-02-08 06:23:34',NULL,'2023-02-08 14:19:30','2d973b66-2a75-439d-8f58-3bf87e75b9f0'),(329,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:34','2023-02-08 06:23:34',NULL,'2023-02-08 14:19:30','626e235d-00e3-4e5c-b7a3-d668ab8a8aa8'),(330,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:34','2023-02-08 06:23:34',NULL,'2023-02-08 14:19:30','f6f9d6f1-6f6a-474c-a0ae-e1388741f236'),(331,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:34','2023-02-08 06:23:34',NULL,'2023-02-08 14:19:30','b9beb1aa-b059-4fcf-9a9c-4d90f568b229'),(332,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:35','2023-02-08 06:23:35',NULL,'2023-02-08 14:19:30','b0d6831e-5c34-4f02-8fdc-f639b423995e'),(333,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:35','2023-02-08 06:23:35',NULL,'2023-02-08 14:19:30','4e9627d7-f643-4475-a113-81cc26536aec'),(334,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:35','2023-02-08 06:23:35',NULL,'2023-02-08 14:19:30','33961697-2b25-489c-984a-52c857376c15'),(335,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:35','2023-02-08 06:23:35',NULL,'2023-02-08 14:19:30','47784f37-b4bb-433c-9014-4ba30548c329'),(336,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:35','2023-02-08 06:23:35',NULL,'2023-02-08 14:19:30','19af1e26-5fae-4441-98fd-f17203fef8c3'),(337,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:35','2023-02-08 06:23:35',NULL,'2023-02-08 14:19:30','75342a24-c5f0-4dba-bfe8-f7aee053a0d1'),(338,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:35','2023-02-08 06:23:35',NULL,'2023-02-08 14:19:30','36bf21bf-2ddb-4add-b485-bc78d41a307c'),(339,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:35','2023-02-08 06:23:35',NULL,'2023-02-08 14:19:30','679a3508-b489-41c7-b7d0-c5711653e65b'),(340,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:35','2023-02-08 06:23:35',NULL,'2023-02-08 14:19:30','c0981bee-40f3-44bb-849c-20d2ddbce4dd'),(341,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:35','2023-02-08 06:23:35',NULL,'2023-02-08 14:19:30','6b2f9052-5155-45ff-ac1d-0b59527e7825'),(342,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:35','2023-02-08 06:23:35',NULL,'2023-02-08 14:19:30','3e04ea0b-907a-4270-a0e7-294d8e317e02'),(343,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:35','2023-02-08 06:23:35',NULL,'2023-02-08 14:19:30','fe9116ab-7d37-4875-97d7-d8e9a0bc6bf1'),(344,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:35','2023-02-08 06:23:35',NULL,'2023-02-08 14:19:30','3064ffcc-c35b-4f19-be23-b62521a20d14'),(345,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:35','2023-02-08 06:23:35',NULL,'2023-02-08 14:19:30','629994f5-a76a-4e2b-89be-851e2107c00b'),(346,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:35','2023-02-08 06:23:35',NULL,'2023-02-08 14:19:30','b17f70e5-84b7-4fcc-a9ca-ae22f2218b95'),(347,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:35','2023-02-08 06:23:35',NULL,'2023-02-08 14:19:30','90cc6554-e2f1-4f7d-8570-b7b31c2756d8'),(348,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:35','2023-02-08 06:23:35',NULL,'2023-02-08 14:19:30','285cfa62-e405-46d7-9009-ee97b3aabb24'),(349,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:35','2023-02-08 06:23:35',NULL,'2023-02-08 14:19:30','fa1a2992-22cf-4fda-9a55-2775147a3dfd'),(350,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:35','2023-02-08 06:23:35',NULL,'2023-02-08 14:19:30','c152ca9d-cca8-44d3-b09d-85e141deb48c'),(351,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:35','2023-02-08 06:23:35',NULL,'2023-02-08 14:19:30','7d04002d-f4db-4080-bf5e-38924ba26dcf'),(352,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:35','2023-02-08 06:23:35',NULL,'2023-02-08 14:19:30','e5bc7fb8-e1f2-483a-ad2b-d9d2e098c5e5'),(353,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:35','2023-02-08 06:23:35',NULL,'2023-02-08 14:19:30','3c634ab9-1cf2-433c-8b3f-4c160a9ab06b'),(354,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:35','2023-02-08 06:23:35',NULL,'2023-02-08 14:19:30','c2af6355-0bf3-4474-b3b3-2672170ad78e'),(355,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:35','2023-02-08 06:23:35',NULL,'2023-02-08 14:19:30','e20deaef-b48e-440d-9ff8-12e61cb3c166'),(356,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:35','2023-02-08 06:23:35',NULL,'2023-02-08 14:19:30','6f837e8f-5b78-437c-aa5a-5aa125dfa0a4'),(357,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:35','2023-02-08 06:23:35',NULL,'2023-02-08 14:19:30','30ab361f-ae26-4602-9ca9-a5952b881acc'),(358,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:36','2023-02-08 06:23:36',NULL,'2023-02-08 14:19:30','7f80b42f-f760-439a-861a-8510336b64f0'),(359,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:36','2023-02-08 06:23:36',NULL,'2023-02-08 14:19:30','063a593a-250c-4e98-8f70-a8a9d944f7e5'),(360,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:36','2023-02-08 06:23:36',NULL,'2023-02-08 14:19:30','5c9e00b6-0b57-424b-a8d9-13b4fec60728'),(361,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:36','2023-02-08 06:23:36',NULL,'2023-02-08 14:19:30','768a81e4-99a7-465f-a484-219e30b81096'),(362,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:36','2023-02-08 06:23:36',NULL,'2023-02-08 14:19:30','92da8219-ad80-401b-aba9-6126ab506f1b'),(363,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:36','2023-02-08 06:23:36',NULL,'2023-02-08 14:19:30','9c3badc1-1b40-43ba-84ba-b8aa1b4b1c3d'),(364,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:36','2023-02-08 06:23:36',NULL,'2023-02-08 14:19:30','27cc2f21-8e06-4ab0-b02f-da468f09d317'),(365,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:36','2023-02-08 06:23:36',NULL,'2023-02-08 14:19:30','f7663743-6fee-4716-a87f-f6897e07e485'),(366,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:36','2023-02-08 06:23:36',NULL,'2023-02-08 14:19:30','6db86321-d5b1-4373-86e8-04c42be1770c'),(367,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:36','2023-02-08 06:23:36',NULL,'2023-02-08 14:19:30','e494d8d7-de57-49a6-809f-a06d54bca7c0'),(368,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:36','2023-02-08 06:23:36',NULL,'2023-02-08 14:19:30','ca56bb55-af93-48c8-8eb5-36fa66c68643'),(369,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:36','2023-02-08 06:23:36',NULL,'2023-02-08 14:19:30','7dd69d7a-6787-40e9-a5ac-75eff4146c12'),(370,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:36','2023-02-08 06:23:36',NULL,'2023-02-08 14:19:30','8fe3746e-88cd-4caf-bc32-3816cd3d4ac5'),(371,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:36','2023-02-08 06:23:36',NULL,'2023-02-08 14:19:30','b1f2c715-195a-4ce6-bf7d-0d4941adcb11'),(372,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:36','2023-02-08 06:23:36',NULL,'2023-02-08 14:19:30','69e09563-8078-4cd7-a6ac-fad73879fdd9'),(373,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:36','2023-02-08 06:23:36',NULL,'2023-02-08 14:19:30','b0e4915f-78b7-4c17-8fb9-9db45774417b'),(374,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:36','2023-02-08 06:23:36',NULL,'2023-02-08 14:19:30','51f1a038-b7c0-4343-9fbd-0b50b66291c9'),(375,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:37','2023-02-08 06:23:37',NULL,'2023-02-08 14:19:30','b38c88d4-d58d-421b-bbe6-013960e58102'),(376,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:37','2023-02-08 06:23:37',NULL,'2023-02-08 14:19:30','05330a80-165f-406c-b21f-46714d62adb9'),(377,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:37','2023-02-08 06:23:37',NULL,'2023-02-08 14:19:30','0995874b-5445-4342-a04b-d4a18c1b6aca'),(378,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:37','2023-02-08 06:23:37',NULL,'2023-02-08 14:19:30','8797730a-d8cf-4214-a8d5-617b002e651a'),(379,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:37','2023-02-08 06:23:37',NULL,'2023-02-08 14:19:30','71c8a304-4048-44fa-a3db-891bedba4a87'),(380,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:37','2023-02-08 06:23:37',NULL,'2023-02-08 14:19:30','bbfa8e7b-eff9-4066-b9e0-646326e57e1b'),(381,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:37','2023-02-08 06:23:37',NULL,'2023-02-08 14:19:30','8fa5dcdc-dc5e-49a5-975a-761e471105b7'),(382,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:37','2023-02-08 06:23:37',NULL,'2023-02-08 14:19:30','bd99ca49-5abe-4808-9ae2-27f413d70fe6'),(383,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:37','2023-02-08 06:23:37',NULL,'2023-02-08 14:19:30','c8bcabbe-db55-4664-8e4b-0aefebae7a16'),(384,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:37','2023-02-08 06:23:37',NULL,'2023-02-08 14:19:30','b56a3683-f00f-4e23-bd43-60ceae532b7e'),(385,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:37','2023-02-08 06:23:37',NULL,'2023-02-08 14:19:30','f1f02fb2-f360-4a92-8fa7-dd7a63f384c6'),(386,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:37','2023-02-08 06:23:37',NULL,'2023-02-08 14:19:30','5ed09604-2372-4aac-871f-cbf47da50313'),(387,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:37','2023-02-08 06:23:37',NULL,'2023-02-08 14:19:30','5f02fe6c-f8e5-4874-b884-30cfd107f9ba'),(388,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:37','2023-02-08 06:23:37',NULL,'2023-02-08 14:19:30','0b898d2a-6b31-431b-aa65-fe684c59356f'),(389,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:38','2023-02-08 06:23:38',NULL,'2023-02-08 14:19:30','7b74b6b9-9eba-432c-9c8d-0e00a9a4248d'),(390,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:38','2023-02-08 06:23:38',NULL,'2023-02-08 14:19:30','2b366958-4d0f-4c20-8168-1b6d1127b215'),(391,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:38','2023-02-08 06:23:38',NULL,'2023-02-08 14:19:30','49e8e60d-2e09-49d5-ae31-61c35dbfab12'),(392,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:38','2023-02-08 06:23:38',NULL,'2023-02-08 14:19:30','fabcbc2b-40db-4e6c-bd79-102fb62e489e'),(393,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:38','2023-02-08 06:23:38',NULL,'2023-02-08 14:19:30','aa7fb7e7-1567-4a9b-9b59-94980a67cee2'),(394,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:38','2023-02-08 06:23:38',NULL,'2023-02-08 14:19:30','612713c0-e350-4795-b587-d7bce26014ac'),(395,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:38','2023-02-08 06:23:38',NULL,'2023-02-08 14:19:30','746c58e0-c124-4ae8-b39a-34960bbaf47f'),(396,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:38','2023-02-08 06:23:38',NULL,'2023-02-08 14:19:30','b541f5d2-6599-4adb-8554-ffc0d598753e'),(397,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:38','2023-02-08 06:23:38',NULL,'2023-02-08 14:19:30','809ed38a-e053-4bf3-89f6-8e9b2a7b59d0'),(398,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:23:38','2023-02-08 06:23:38',NULL,'2023-02-08 14:19:30','791012b3-0f1f-4a17-b333-4b9ae7152000'),(399,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:24:50','2023-02-08 06:24:50',NULL,'2023-02-08 06:29:19','a5e8ea86-474d-48df-be26-a0bf4510ce79'),(400,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:29:24','2023-02-08 06:29:24',NULL,'2023-02-08 14:19:30','b48ab7fe-0530-4f1c-b963-5fa40d5478b0'),(401,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2023-02-08 06:31:39','2023-02-08 06:31:39',NULL,'2023-02-08 14:19:30','093d7b41-c344-4e5a-b7ea-6b466732dbfb');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,1,'2023-02-02 05:28:23','2023-02-02 05:28:23','9276ec33-c4e9-4f94-9590-a6c8f9ed630a'),(2,2,1,NULL,NULL,1,'2023-02-08 03:29:22','2023-02-08 03:29:22','7377e9c3-66c7-4c8f-92c4-a3a0855565be'),(3,3,1,NULL,NULL,1,'2023-02-08 03:43:59','2023-02-08 03:43:59','a6e47ea8-f2a0-4ae1-9efd-0acc4e873620'),(4,4,1,NULL,NULL,1,'2023-02-08 03:54:58','2023-02-08 03:54:58','77d452e5-8b27-400d-9fd4-724c8fe6ea31'),(5,5,1,NULL,NULL,1,'2023-02-08 03:54:58','2023-02-08 03:54:58','c0db6751-1fa3-426e-afeb-708816affcae'),(6,6,1,NULL,NULL,1,'2023-02-08 03:54:58','2023-02-08 03:54:58','178896a1-cd50-460f-8ed6-f6c118b6d1f4'),(7,7,1,NULL,NULL,1,'2023-02-08 03:54:58','2023-02-08 03:54:58','2a7867df-656d-4f05-8358-81fac00d9258'),(8,8,1,NULL,NULL,1,'2023-02-08 03:54:58','2023-02-08 03:54:58','b71770c9-ef4c-40f3-af58-ca0649780474'),(9,9,1,NULL,NULL,1,'2023-02-08 03:54:58','2023-02-08 03:54:58','54b83df1-6096-4787-88dd-b0478e8dafde'),(10,10,1,NULL,NULL,1,'2023-02-08 03:54:58','2023-02-08 03:54:58','1e12ce52-fd1e-4ebb-a5cc-99cd636b5bd6'),(11,11,1,NULL,NULL,1,'2023-02-08 03:54:59','2023-02-08 03:54:59','f56d1fdb-9f49-432c-97c3-592507d79a8d'),(12,12,1,NULL,NULL,1,'2023-02-08 03:54:59','2023-02-08 03:54:59','c6818869-3e14-41ec-bc6b-3787e640be68'),(13,13,1,NULL,NULL,1,'2023-02-08 03:54:59','2023-02-08 03:54:59','84d22995-3a68-4b43-9cba-4a9b67ed45ef'),(14,14,1,NULL,NULL,1,'2023-02-08 03:54:59','2023-02-08 03:54:59','db53b71d-a32d-4a34-b709-4a0d222bea44'),(15,15,1,NULL,NULL,1,'2023-02-08 03:54:59','2023-02-08 03:54:59','da9804b3-1c42-4467-958f-4ae1415fae88'),(16,16,1,NULL,NULL,1,'2023-02-08 03:54:59','2023-02-08 03:54:59','366ccea7-b326-4877-a190-e9422411d41a'),(17,17,1,NULL,NULL,1,'2023-02-08 03:54:59','2023-02-08 03:54:59','8e94d9f8-0657-46e7-9ce7-34fb224cc17e'),(18,18,1,NULL,NULL,1,'2023-02-08 03:54:59','2023-02-08 03:54:59','ade011c6-a72b-404d-9c8d-8a60cbadf4e6'),(19,19,1,NULL,NULL,1,'2023-02-08 03:54:59','2023-02-08 03:54:59','7c451fd4-b0db-40f6-a2d6-01a791ddcb91'),(20,20,1,NULL,NULL,1,'2023-02-08 03:54:59','2023-02-08 03:54:59','4815e4b4-b006-4c7b-8720-7494d12e622a'),(21,21,1,NULL,NULL,1,'2023-02-08 03:54:59','2023-02-08 03:54:59','78ed95b1-2764-469d-9d49-1cacfc9905df'),(22,22,1,NULL,NULL,1,'2023-02-08 03:54:59','2023-02-08 03:54:59','708ea924-2f75-4f17-887c-f2473640d377'),(23,23,1,NULL,NULL,1,'2023-02-08 03:54:59','2023-02-08 03:54:59','c427dd3f-6daa-4b11-a07c-fb70c2e88831'),(24,24,1,NULL,NULL,1,'2023-02-08 03:54:59','2023-02-08 03:54:59','46fcfb68-65f1-4843-809d-9b76b38ee8e6'),(25,25,1,NULL,NULL,1,'2023-02-08 03:54:59','2023-02-08 03:54:59','04824f02-fc91-4d13-a652-742139126935'),(26,26,1,NULL,NULL,1,'2023-02-08 03:54:59','2023-02-08 03:54:59','63fb9200-36f3-414f-be50-bd2354ba09c6'),(27,27,1,NULL,NULL,1,'2023-02-08 03:54:59','2023-02-08 03:54:59','2533b26b-80a1-4611-97bf-3778d5a76b42'),(28,28,1,NULL,NULL,1,'2023-02-08 03:54:59','2023-02-08 03:54:59','a1354f84-019c-497a-bfb3-bae5b9dd9ea1'),(29,29,1,NULL,NULL,1,'2023-02-08 03:54:59','2023-02-08 03:54:59','2e80966a-c75d-4aaa-a406-30fa1c410086'),(30,30,1,NULL,NULL,1,'2023-02-08 03:54:59','2023-02-08 03:54:59','5c4c002c-208e-433b-bb72-fce9660c31ef'),(31,31,1,NULL,NULL,1,'2023-02-08 03:54:59','2023-02-08 03:54:59','c5a71314-20e6-4f18-8a44-2e1f3cb43aa7'),(32,32,1,NULL,NULL,1,'2023-02-08 03:54:59','2023-02-08 03:54:59','2b017e4e-e450-452a-a7c5-a5685e4cf5ce'),(33,33,1,NULL,NULL,1,'2023-02-08 03:54:59','2023-02-08 03:54:59','003b4d22-4beb-4f69-bd6f-3ee02e204a89'),(34,34,1,NULL,NULL,1,'2023-02-08 03:54:59','2023-02-08 03:54:59','988e5d94-96f0-4eee-bcb1-48fd7d56a3bf'),(35,35,1,NULL,NULL,1,'2023-02-08 03:54:59','2023-02-08 03:54:59','b087c1f3-12a3-405f-b2be-870492c28cd0'),(36,36,1,NULL,NULL,1,'2023-02-08 03:55:00','2023-02-08 03:55:00','e89c866c-9c2a-4641-9410-4ea63449aff3'),(37,37,1,NULL,NULL,1,'2023-02-08 03:55:00','2023-02-08 03:55:00','94874aac-24f2-4a69-9682-2a665d076a56'),(38,38,1,NULL,NULL,1,'2023-02-08 03:55:00','2023-02-08 03:55:00','51bd24b2-e95d-4ab9-8f32-ffac47c91886'),(39,39,1,NULL,NULL,1,'2023-02-08 03:55:00','2023-02-08 03:55:00','169696a8-e122-44ea-958d-60d4f7eb271e'),(40,40,1,NULL,NULL,1,'2023-02-08 03:55:00','2023-02-08 03:55:00','5cab0abd-0398-479a-8a08-08ce8f8f1692'),(41,41,1,NULL,NULL,1,'2023-02-08 03:55:00','2023-02-08 03:55:00','e02fe972-0947-4757-8671-294a9166f5c8'),(42,42,1,NULL,NULL,1,'2023-02-08 03:55:00','2023-02-08 03:55:00','0a168807-c07b-4917-8715-2a9e1850946f'),(43,43,1,NULL,NULL,1,'2023-02-08 03:55:00','2023-02-08 03:55:00','90e90299-bf0c-4217-a239-3833cb6cf6b5'),(44,44,1,NULL,NULL,1,'2023-02-08 03:55:00','2023-02-08 03:55:00','6e493e53-799f-4982-a6d2-7f87eda1c20b'),(45,45,1,NULL,NULL,1,'2023-02-08 03:55:00','2023-02-08 03:55:00','62370447-c9fc-4187-9f6e-6f117d6bd9b4'),(46,46,1,NULL,NULL,1,'2023-02-08 03:55:00','2023-02-08 03:55:00','8d6aaafd-f740-4478-9e5b-341afd37acb1'),(47,47,1,NULL,NULL,1,'2023-02-08 03:55:00','2023-02-08 03:55:00','082debaf-ad05-4ad8-9e61-457f12acc689'),(48,48,1,NULL,NULL,1,'2023-02-08 03:55:00','2023-02-08 03:55:00','3cde1493-9a6f-41fa-bd68-6bc555e84ff3'),(49,49,1,NULL,NULL,1,'2023-02-08 03:55:00','2023-02-08 03:55:00','e5811775-067c-47c0-9805-4376d9b374b4'),(50,50,1,NULL,NULL,1,'2023-02-08 03:55:00','2023-02-08 03:55:00','17b606e6-67dc-498e-81dc-2e1af68c4b6f'),(51,51,1,NULL,NULL,1,'2023-02-08 03:55:00','2023-02-08 03:55:00','2eefcf04-06b6-4e1a-bf84-401c9ad900f3'),(52,52,1,NULL,NULL,1,'2023-02-08 03:55:00','2023-02-08 03:55:00','f649a869-af62-4cc1-bf1c-b4b6fac4b21c'),(53,53,1,NULL,NULL,1,'2023-02-08 03:55:00','2023-02-08 03:55:00','7eb8472d-f127-4cd6-9219-2062792426e4'),(54,54,1,NULL,NULL,1,'2023-02-08 03:55:00','2023-02-08 03:55:00','e5b1b182-1384-42b2-8a0b-a0064e12f522'),(55,55,1,NULL,NULL,1,'2023-02-08 03:55:00','2023-02-08 03:55:00','46bcc086-59ca-403f-9834-58ea5756d205'),(56,56,1,NULL,NULL,1,'2023-02-08 03:55:00','2023-02-08 03:55:00','c3676678-b283-4337-a6a1-ea03314d3573'),(57,57,1,NULL,NULL,1,'2023-02-08 03:55:00','2023-02-08 03:55:00','25b56157-cd54-4f24-a267-89fd31c39d38'),(58,58,1,NULL,NULL,1,'2023-02-08 03:55:00','2023-02-08 03:55:00','22db86b9-1c9f-40a8-8a60-e5f39961b070'),(59,59,1,NULL,NULL,1,'2023-02-08 03:55:00','2023-02-08 03:55:00','81446bd3-a276-4121-a625-74cb4faebfcf'),(60,60,1,NULL,NULL,1,'2023-02-08 03:55:00','2023-02-08 03:55:00','2ea5d2d6-3fec-4932-9c45-2940072c5f3b'),(61,61,1,NULL,NULL,1,'2023-02-08 03:55:00','2023-02-08 03:55:00','39aef7ef-7999-4c21-b2a1-1a24c5fc0183'),(62,62,1,NULL,NULL,1,'2023-02-08 03:55:00','2023-02-08 03:55:00','e47b5dd5-f069-404f-a55a-845e588cd240'),(63,63,1,NULL,NULL,1,'2023-02-08 03:55:01','2023-02-08 03:55:01','0c6d2247-d58b-4cd7-a4c3-6a9a11b0c291'),(64,64,1,NULL,NULL,1,'2023-02-08 03:55:01','2023-02-08 03:55:01','8c1a1de3-2811-44b3-afd7-b9f1ac06a1e0'),(65,65,1,NULL,NULL,1,'2023-02-08 03:55:01','2023-02-08 03:55:01','f18bc2da-4623-47b9-80fc-b3665380c81d'),(66,66,1,NULL,NULL,1,'2023-02-08 03:55:01','2023-02-08 03:55:01','8bb5f76c-aaef-4ce0-a638-7012fd2cb7fd'),(67,67,1,NULL,NULL,1,'2023-02-08 03:55:01','2023-02-08 03:55:01','11b097b0-09bf-473c-8626-02575a69dfe9'),(68,68,1,NULL,NULL,1,'2023-02-08 03:55:01','2023-02-08 03:55:01','e4e7f63b-591c-4b79-8477-edf2f337bac2'),(69,69,1,NULL,NULL,1,'2023-02-08 03:55:01','2023-02-08 03:55:01','95f3722b-5122-45db-8cda-a3707f2c9520'),(70,70,1,NULL,NULL,1,'2023-02-08 03:55:01','2023-02-08 03:55:01','05125514-c8cf-4160-89bb-b96d8eb19f28'),(71,71,1,NULL,NULL,1,'2023-02-08 03:55:01','2023-02-08 03:55:01','289f3134-7d12-43df-adbf-3f24bc5e1de4'),(72,72,1,NULL,NULL,1,'2023-02-08 03:55:01','2023-02-08 03:55:01','7f307453-9f43-4c79-b4fb-0fdd228098da'),(73,73,1,NULL,NULL,1,'2023-02-08 03:55:01','2023-02-08 03:55:01','0f4a415f-733f-4a33-b81d-4382bfe5b2c4'),(74,74,1,NULL,NULL,1,'2023-02-08 03:55:01','2023-02-08 03:55:01','d2618f77-e70c-4e8d-9997-665b69e717f1'),(75,75,1,NULL,NULL,1,'2023-02-08 03:55:01','2023-02-08 03:55:01','13b99f50-c079-4352-bb15-d7b7cde6993d'),(76,76,1,NULL,NULL,1,'2023-02-08 03:55:01','2023-02-08 03:55:01','bb96e5f3-47f1-4368-a9fe-1442321d8ad0'),(77,77,1,NULL,NULL,1,'2023-02-08 03:55:01','2023-02-08 03:55:01','d1860259-3b54-43ae-9f9d-a18407ea5a5d'),(78,78,1,NULL,NULL,1,'2023-02-08 03:55:01','2023-02-08 03:55:01','55691561-63e5-44dd-9a22-266828b6e884'),(79,79,1,NULL,NULL,1,'2023-02-08 03:55:01','2023-02-08 03:55:01','14c8a5af-6c73-4c03-8f8f-dcd5323d8ea2'),(80,80,1,NULL,NULL,1,'2023-02-08 03:55:01','2023-02-08 03:55:01','b38c7790-adfa-404f-a7ae-da8777fcd61a'),(81,81,1,NULL,NULL,1,'2023-02-08 03:55:01','2023-02-08 03:55:01','6f1295c2-f3a1-40fa-93b7-f5aec372c864'),(82,82,1,NULL,NULL,1,'2023-02-08 03:55:01','2023-02-08 03:55:01','79353c5d-f86d-4d8f-b704-34eb7d289fcf'),(83,83,1,NULL,NULL,1,'2023-02-08 03:55:01','2023-02-08 03:55:01','d0caac64-9a2b-4c8b-822c-d13a8354a7df'),(84,84,1,NULL,NULL,1,'2023-02-08 03:55:01','2023-02-08 03:55:01','cf4c9e9f-6398-481e-9f78-332a39dfc565'),(85,85,1,NULL,NULL,1,'2023-02-08 03:55:01','2023-02-08 03:55:01','9026e364-c066-41d3-9e45-3395b11ca1d0'),(86,86,1,NULL,NULL,1,'2023-02-08 03:55:01','2023-02-08 03:55:01','63255704-56eb-43f1-bd84-0923a9ec5bab'),(87,87,1,NULL,NULL,1,'2023-02-08 03:55:01','2023-02-08 03:55:01','45705e51-6fc4-4078-a446-bb06921c4fb2'),(88,88,1,NULL,NULL,1,'2023-02-08 03:55:01','2023-02-08 03:55:01','13809040-517e-4c45-9b4b-189d8505b8b3'),(89,89,1,NULL,NULL,1,'2023-02-08 03:55:02','2023-02-08 03:55:02','bd32c3b5-c3ef-4e3c-b95f-e2c3056a6f16'),(90,90,1,NULL,NULL,1,'2023-02-08 03:55:02','2023-02-08 03:55:02','14dd20ce-b207-4b80-844a-147d8f18a4c1'),(91,91,1,NULL,NULL,1,'2023-02-08 03:55:02','2023-02-08 03:55:02','3926ed49-3b88-4835-90f6-a7d5d93fbe95'),(92,92,1,NULL,NULL,1,'2023-02-08 03:55:02','2023-02-08 03:55:02','fa2a824e-9358-43f8-900e-d1ef562b40eb'),(93,93,1,NULL,NULL,1,'2023-02-08 03:55:02','2023-02-08 03:55:02','91ea9994-91fc-45b7-aedd-26fc49a20a54'),(94,94,1,NULL,NULL,1,'2023-02-08 03:55:02','2023-02-08 03:55:02','2fb80fe6-562d-4ff2-83f2-4976ed62b101'),(95,95,1,NULL,NULL,1,'2023-02-08 03:55:02','2023-02-08 03:55:02','add6cf66-341a-45c4-b02b-05d20ff73481'),(96,96,1,NULL,NULL,1,'2023-02-08 03:55:02','2023-02-08 03:55:02','7285f70d-168e-4526-94e1-cab3cec2fff3'),(97,97,1,NULL,NULL,1,'2023-02-08 03:55:02','2023-02-08 03:55:02','70bb217d-a7f7-45f2-a4c5-b03299407c46'),(98,98,1,NULL,NULL,1,'2023-02-08 03:55:02','2023-02-08 03:55:02','4b1d1fff-e1d6-40c7-be18-3b44ea8a705d'),(99,99,1,NULL,NULL,1,'2023-02-08 03:55:02','2023-02-08 03:55:02','f494451e-55e4-4c0f-936d-841501adb24c'),(100,100,1,NULL,NULL,1,'2023-02-08 03:55:02','2023-02-08 03:55:02','92481319-3900-4b6e-8189-c0d823957625'),(101,101,1,NULL,NULL,1,'2023-02-08 03:55:02','2023-02-08 03:55:02','be7e4d4b-de5b-4018-9de5-8fa23f01f354'),(102,102,1,NULL,NULL,1,'2023-02-08 03:55:02','2023-02-08 03:55:02','769f2f57-1aff-4244-8581-d4d31c5cfcec'),(103,103,1,NULL,NULL,1,'2023-02-08 03:55:02','2023-02-08 03:55:02','7eaca20d-7b84-47ca-83e6-7dd0cf8fbfa2'),(104,104,1,NULL,NULL,1,'2023-02-08 03:55:02','2023-02-08 03:55:02','ce59091b-90d4-4720-a440-acf4ce93a41a'),(105,105,1,NULL,NULL,1,'2023-02-08 03:55:02','2023-02-08 03:55:02','ff9e48d9-b564-4974-b871-f81be4865277'),(106,106,1,NULL,NULL,1,'2023-02-08 03:55:02','2023-02-08 03:55:02','e075f99d-fa15-4d37-ad40-7a46c81a7f5b'),(107,107,1,NULL,NULL,1,'2023-02-08 03:55:03','2023-02-08 03:55:03','f507d15e-e432-41cc-89f4-7b69da33f6e3'),(108,108,1,NULL,NULL,1,'2023-02-08 03:55:03','2023-02-08 03:55:03','5c0624e3-fa90-4e77-b6e0-2faa12fe6ebe'),(109,109,1,NULL,NULL,1,'2023-02-08 03:55:03','2023-02-08 03:55:03','c1ea31ae-d521-451b-b6af-0db961bc6aa7'),(110,110,1,NULL,NULL,1,'2023-02-08 03:55:03','2023-02-08 03:55:03','136bfeae-466b-43b8-9300-6dcb6c949cd7'),(111,111,1,NULL,NULL,1,'2023-02-08 03:55:03','2023-02-08 03:55:03','3acb5679-5c1a-45f4-a009-6cab564e6de0'),(112,112,1,NULL,NULL,1,'2023-02-08 03:55:03','2023-02-08 03:55:03','49f32650-1f23-46d0-9d5a-0d3e98ac460f'),(113,113,1,NULL,NULL,1,'2023-02-08 03:55:03','2023-02-08 03:55:03','ae2c0f31-6d44-4bc9-958f-30ceb6a03582'),(114,114,1,NULL,NULL,1,'2023-02-08 03:55:03','2023-02-08 03:55:03','28b739e8-1248-4f04-81ab-8a941773bbca'),(115,115,1,NULL,NULL,1,'2023-02-08 03:55:03','2023-02-08 03:55:03','8f5b2dcb-f9f0-4853-bbde-b8885f133a04'),(116,116,1,NULL,NULL,1,'2023-02-08 03:55:03','2023-02-08 03:55:03','d11a1c87-545b-4149-b863-a940a0074743'),(117,117,1,NULL,NULL,1,'2023-02-08 03:55:03','2023-02-08 03:55:03','23782c64-25f4-445b-8535-1001884519a3'),(118,118,1,NULL,NULL,1,'2023-02-08 03:55:03','2023-02-08 03:55:03','89230b2c-91ac-4d21-a308-b1e88546e40a'),(119,119,1,NULL,NULL,1,'2023-02-08 03:55:04','2023-02-08 03:55:04','b08a84e8-79a1-443d-8fc1-d8477f955460'),(120,120,1,NULL,NULL,1,'2023-02-08 03:55:04','2023-02-08 03:55:04','6c5b4bc9-67bc-43ec-b894-64dcbc23e15e'),(121,121,1,NULL,NULL,1,'2023-02-08 03:55:04','2023-02-08 03:55:04','bd4acc89-52d3-4004-94d9-2729e169defd'),(122,122,1,NULL,NULL,1,'2023-02-08 03:55:04','2023-02-08 03:55:04','e9ac273d-e5e0-417b-93ab-ea1f1b4ed68f'),(123,123,1,NULL,NULL,1,'2023-02-08 03:55:04','2023-02-08 03:55:04','92daeb1f-2302-4e15-a0e1-35a2cc9a6fc9'),(124,124,1,NULL,NULL,1,'2023-02-08 03:55:04','2023-02-08 03:55:04','0a576a1b-d6b8-4c4b-bfe6-5e32ff56f021'),(125,125,1,NULL,NULL,1,'2023-02-08 03:55:04','2023-02-08 03:55:04','e62e192b-4d14-4131-bd5e-3b13121992ae'),(126,126,1,NULL,NULL,1,'2023-02-08 03:55:04','2023-02-08 03:55:04','40e26124-1465-4ef0-b98a-e6ba6cb18ace'),(127,127,1,NULL,NULL,1,'2023-02-08 03:55:04','2023-02-08 03:55:04','3b17b72e-76b6-4e19-90d6-1c26219c757c'),(128,128,1,NULL,NULL,1,'2023-02-08 03:55:04','2023-02-08 03:55:04','d57ee3d0-d062-45db-9041-872840cf039a'),(129,129,1,NULL,NULL,1,'2023-02-08 03:55:04','2023-02-08 03:55:04','6b7ff7be-9565-43cc-8046-9ba28870b7e4'),(130,130,1,NULL,NULL,1,'2023-02-08 03:55:04','2023-02-08 03:55:04','df570633-a4e9-46f0-90eb-88abff67f043'),(131,131,1,NULL,NULL,1,'2023-02-08 03:55:04','2023-02-08 03:55:04','77506aba-fc04-432e-8031-5d4fa95f294c'),(132,132,1,NULL,NULL,1,'2023-02-08 03:55:04','2023-02-08 03:55:04','f06394e4-2849-44d2-ac0b-ba4a7063bbd4'),(133,133,1,NULL,NULL,1,'2023-02-08 03:55:04','2023-02-08 03:55:04','417da463-07d0-42d7-b67c-3d085a05123d'),(134,134,1,NULL,NULL,1,'2023-02-08 03:55:04','2023-02-08 03:55:04','ab1cba98-4a9e-45b4-9990-39802fb705ee'),(135,135,1,NULL,NULL,1,'2023-02-08 03:55:04','2023-02-08 03:55:04','9983219d-e18f-42dc-bf80-cb4251c1e867'),(136,136,1,NULL,NULL,1,'2023-02-08 03:55:04','2023-02-08 03:55:04','b3b646aa-0de4-4b57-8d56-d115dbc4f226'),(137,137,1,NULL,NULL,1,'2023-02-08 03:55:04','2023-02-08 03:55:04','7558dca3-016b-4638-8226-727a350eddd5'),(138,138,1,NULL,NULL,1,'2023-02-08 03:55:04','2023-02-08 03:55:04','8331d7f7-b65e-400d-ba95-adf95698afa7'),(139,139,1,NULL,NULL,1,'2023-02-08 03:55:04','2023-02-08 03:55:04','23012233-bb6b-439b-8b24-6fc4b4fbb27c'),(140,140,1,NULL,NULL,1,'2023-02-08 03:55:04','2023-02-08 03:55:04','6f748886-42ae-4667-9eb0-2f0013c83fe6'),(141,141,1,NULL,NULL,1,'2023-02-08 03:55:05','2023-02-08 03:55:05','83b719c2-85bf-4f0c-b89d-270a095a1155'),(142,142,1,NULL,NULL,1,'2023-02-08 03:55:05','2023-02-08 03:55:05','8e7ff1e9-da6a-4b61-ad42-66c92167b1b4'),(143,143,1,NULL,NULL,1,'2023-02-08 03:55:05','2023-02-08 03:55:05','67b8c7d1-2f1b-4a8c-a2c8-dc3f2b1d54ad'),(144,144,1,NULL,NULL,1,'2023-02-08 03:55:05','2023-02-08 03:55:05','e262dd16-dbee-469d-ab2d-b30287b916b2'),(145,145,1,NULL,NULL,1,'2023-02-08 03:55:05','2023-02-08 03:55:05','b59f495f-6ba9-4b03-865f-1979e170b3cb'),(146,146,1,NULL,NULL,1,'2023-02-08 03:55:05','2023-02-08 03:55:05','98a218b6-4fde-476f-a3f6-4cb18005317e'),(147,147,1,NULL,NULL,1,'2023-02-08 03:55:05','2023-02-08 03:55:05','a38c5f1a-0621-4a06-b03c-3ac52f9ae6aa'),(148,148,1,NULL,NULL,1,'2023-02-08 03:55:05','2023-02-08 03:55:05','aa08dfc4-d7f1-45f1-b96d-ce9f2160a782'),(149,149,1,NULL,NULL,1,'2023-02-08 03:55:05','2023-02-08 03:55:05','3b9f6d84-6b58-4be0-a194-92e52ec9d5c2'),(150,150,1,NULL,NULL,1,'2023-02-08 03:55:05','2023-02-08 03:55:05','91ec7ef6-5e69-4b8e-b56e-e929dc80247e'),(151,151,1,NULL,NULL,1,'2023-02-08 03:55:05','2023-02-08 03:55:05','8d8568c7-20fd-42c5-ad3c-379885f6c3b1'),(152,152,1,NULL,NULL,1,'2023-02-08 03:55:05','2023-02-08 03:55:05','b97ccde7-6b9e-4434-91cb-ecae4a8f3d8e'),(153,153,1,NULL,NULL,1,'2023-02-08 03:55:05','2023-02-08 03:55:05','65678725-ea40-4ae2-ada7-2836801e03cd'),(154,154,1,NULL,NULL,1,'2023-02-08 03:55:05','2023-02-08 03:55:05','cf360dbb-d3f6-48f4-9c7d-4d8795d3cc93'),(155,155,1,NULL,NULL,1,'2023-02-08 03:55:05','2023-02-08 03:55:05','571b285e-033a-4088-b62e-e80522c53fb7'),(156,156,1,NULL,NULL,1,'2023-02-08 03:55:05','2023-02-08 03:55:05','8af6c4df-9ccf-439b-97b1-48fedcf83982'),(157,157,1,NULL,NULL,1,'2023-02-08 03:55:05','2023-02-08 03:55:05','8b41a9e3-0cbc-4896-9ecd-d46a5035b143'),(158,158,1,NULL,NULL,1,'2023-02-08 03:55:05','2023-02-08 03:55:05','02ea179f-0d8f-4735-be88-8a88d33fbb85'),(159,159,1,NULL,NULL,1,'2023-02-08 03:55:05','2023-02-08 03:55:05','c1dfc878-c859-4771-9f1f-3d687702cbfd'),(160,160,1,NULL,NULL,1,'2023-02-08 03:55:05','2023-02-08 03:55:05','8465c546-052f-4ccc-b4b4-32a9dea74849'),(161,161,1,NULL,NULL,1,'2023-02-08 03:55:05','2023-02-08 03:55:05','f01351b3-254a-4964-92ee-cbbc8698d789'),(162,162,1,NULL,NULL,1,'2023-02-08 03:55:05','2023-02-08 03:55:05','d20fb457-28c3-4643-8428-f64dcbfc28d1'),(163,163,1,NULL,NULL,1,'2023-02-08 03:55:05','2023-02-08 03:55:05','98a43518-3ce7-4a17-8228-9ea62f307537'),(164,164,1,NULL,NULL,1,'2023-02-08 03:55:05','2023-02-08 03:55:05','ef16212a-6292-4e5e-b6d4-9d60806cd30a'),(165,165,1,NULL,NULL,1,'2023-02-08 03:55:05','2023-02-08 03:55:05','5a0e3399-5085-49cd-af7d-b677f07df358'),(166,166,1,NULL,NULL,1,'2023-02-08 03:55:05','2023-02-08 03:55:05','ce793cb9-5d50-4d4c-8ec0-9870e90f1d49'),(167,167,1,NULL,NULL,1,'2023-02-08 03:55:06','2023-02-08 03:55:06','fd8c3eb3-c969-4f22-a046-3617f276e2bc'),(168,168,1,NULL,NULL,1,'2023-02-08 03:55:06','2023-02-08 03:55:06','fb6abc44-14b0-48a1-8150-65dcd0b8ecb9'),(169,169,1,NULL,NULL,1,'2023-02-08 03:55:06','2023-02-08 03:55:06','084e1d0a-6a18-4075-9682-9fead5b39a5e'),(170,170,1,NULL,NULL,1,'2023-02-08 03:55:06','2023-02-08 03:55:06','b2421ac3-7644-43f9-a371-39ca5405fcbb'),(171,171,1,NULL,NULL,1,'2023-02-08 03:55:06','2023-02-08 03:55:06','e9cec8b7-09e7-494a-9b54-a29113c7d9aa'),(172,172,1,NULL,NULL,1,'2023-02-08 03:55:06','2023-02-08 03:55:06','1b589e54-445a-48d8-8b8e-0e21477c662c'),(173,173,1,NULL,NULL,1,'2023-02-08 03:55:06','2023-02-08 03:55:06','d6975020-d0a9-48ae-b2e2-78de01f95bf0'),(174,174,1,NULL,NULL,1,'2023-02-08 03:55:06','2023-02-08 03:55:06','fded8d44-d31d-4a47-aa6d-a36c1a33ce22'),(175,175,1,NULL,NULL,1,'2023-02-08 03:55:06','2023-02-08 03:55:06','9722ff56-e193-4651-9d8e-14de1c0e1390'),(176,176,1,NULL,NULL,1,'2023-02-08 03:55:06','2023-02-08 03:55:06','ea0effe5-2a85-4c58-8dfd-c930464cd442'),(177,177,1,NULL,NULL,1,'2023-02-08 03:55:06','2023-02-08 03:55:06','43189172-42da-49fe-996c-5fd2aab9d2ef'),(178,178,1,NULL,NULL,1,'2023-02-08 03:55:06','2023-02-08 03:55:06','dff29382-788b-4654-8996-f2c4f87e85c8'),(179,179,1,NULL,NULL,1,'2023-02-08 03:55:06','2023-02-08 03:55:06','7380e035-32f9-445d-9b16-bc4ff6efc1c7'),(180,180,1,NULL,NULL,1,'2023-02-08 03:55:06','2023-02-08 03:55:06','b309f783-ac53-4c4d-ab31-fbd35ea2be7f'),(181,181,1,NULL,NULL,1,'2023-02-08 03:55:06','2023-02-08 03:55:06','4954794c-e9ed-40a9-b655-e19c006c921a'),(182,182,1,NULL,NULL,1,'2023-02-08 03:55:07','2023-02-08 03:55:07','05211718-975c-4629-9307-c1a84d5f85ba'),(183,183,1,NULL,NULL,1,'2023-02-08 03:55:07','2023-02-08 03:55:07','f55a495b-323b-470a-8d5d-8ce9ce418fa1'),(184,184,1,NULL,NULL,1,'2023-02-08 03:55:07','2023-02-08 03:55:07','f8602a7a-f339-4174-8168-9662d53243c1'),(185,185,1,NULL,NULL,1,'2023-02-08 03:55:07','2023-02-08 03:55:07','2aee7391-e0d3-4b4e-802d-1b8356ae108a'),(186,186,1,NULL,NULL,1,'2023-02-08 03:55:07','2023-02-08 03:55:07','d00c720f-89ca-40f9-9224-e5092e23559d'),(187,187,1,NULL,NULL,1,'2023-02-08 03:55:07','2023-02-08 03:55:07','f1eb7917-c808-45c1-a535-ffa8b4e9ee2e'),(188,188,1,NULL,NULL,1,'2023-02-08 03:55:07','2023-02-08 03:55:07','99d60203-6213-432e-bb11-253befddb32f'),(189,189,1,NULL,NULL,1,'2023-02-08 03:55:07','2023-02-08 03:55:07','bd41a7ee-8bc2-4c76-8aeb-f6c5ffa438a7'),(190,190,1,NULL,NULL,1,'2023-02-08 03:55:07','2023-02-08 03:55:07','edc639b8-5234-48fe-8444-3a5ffbc112e1'),(191,191,1,NULL,NULL,1,'2023-02-08 03:55:07','2023-02-08 03:55:07','2b096f97-dedb-464d-83be-b5f26c1a32c6'),(192,192,1,NULL,NULL,1,'2023-02-08 03:55:07','2023-02-08 03:55:07','d2c174a2-6160-4227-93f1-89004906da88'),(193,193,1,NULL,NULL,1,'2023-02-08 03:55:08','2023-02-08 03:55:08','cdbfd9f6-5c0a-4230-8ca4-f33f48e19291'),(194,194,1,NULL,NULL,1,'2023-02-08 03:55:08','2023-02-08 03:55:08','96050610-9f9c-45cc-8dee-f9e839a68de4'),(195,195,1,NULL,NULL,1,'2023-02-08 03:55:08','2023-02-08 03:55:08','2c7e996c-31e5-473d-8702-ab3fa0303eb3'),(196,196,1,NULL,NULL,1,'2023-02-08 03:55:08','2023-02-08 03:55:08','8afacff0-c7b6-4c17-b9a0-868e904c0728'),(197,197,1,NULL,NULL,1,'2023-02-08 03:55:08','2023-02-08 03:55:08','3c74759d-4f67-4408-9341-3fca26787169'),(198,198,1,NULL,NULL,1,'2023-02-08 03:55:08','2023-02-08 03:55:08','75975c48-5a2c-4402-9816-a899174b7a29'),(199,199,1,NULL,NULL,1,'2023-02-08 03:55:08','2023-02-08 03:55:08','4e249551-5ee9-48a3-816b-6d1a374d14f7'),(200,200,1,NULL,NULL,1,'2023-02-08 03:55:08','2023-02-08 03:55:08','05f18e7b-91f3-4c98-9afe-bbdc6b927361'),(201,201,1,NULL,NULL,1,'2023-02-08 06:12:08','2023-02-08 06:12:08','d0a116fb-00e5-4acf-9fbe-929e6dbf0bf4'),(202,202,1,NULL,NULL,1,'2023-02-08 06:23:29','2023-02-08 06:23:29','334d3215-fbef-4a08-a28b-d0ba0b047f4c'),(203,203,1,NULL,NULL,1,'2023-02-08 06:23:29','2023-02-08 06:23:29','0019ede1-4bfa-4356-a119-bdbd169de330'),(204,204,1,NULL,NULL,1,'2023-02-08 06:23:29','2023-02-08 06:23:29','a8bb414c-5cb3-42bb-bfa2-f184067a2a5b'),(205,205,1,NULL,NULL,1,'2023-02-08 06:23:29','2023-02-08 06:23:29','9bc76f04-5728-4b43-813e-03638e3125e8'),(206,206,1,NULL,NULL,1,'2023-02-08 06:23:29','2023-02-08 06:23:29','b41e4f50-88b9-41c1-ba4d-19b0e8163a62'),(207,207,1,NULL,NULL,1,'2023-02-08 06:23:29','2023-02-08 06:23:29','3f4cba90-59d7-4768-9c94-26547cc6a587'),(208,208,1,NULL,NULL,1,'2023-02-08 06:23:29','2023-02-08 06:23:29','0db56ff3-566d-4f44-9933-3dfc4e179390'),(209,209,1,NULL,NULL,1,'2023-02-08 06:23:29','2023-02-08 06:23:29','3d0ea38c-8fdf-44e1-96b7-274563570011'),(210,210,1,NULL,NULL,1,'2023-02-08 06:23:29','2023-02-08 06:23:29','2bac1b6b-63fa-428c-93b1-5c2f8606b96b'),(211,211,1,NULL,NULL,1,'2023-02-08 06:23:29','2023-02-08 06:23:29','908116cf-2f05-4497-81c4-b9b8a21350c8'),(212,212,1,NULL,NULL,1,'2023-02-08 06:23:29','2023-02-08 06:23:29','b1c98ce5-30bf-478c-be64-d282479b191a'),(213,213,1,NULL,NULL,1,'2023-02-08 06:23:29','2023-02-08 06:23:29','9d5b263a-bc2b-4334-98d8-fa3dbd6353a9'),(214,214,1,NULL,NULL,1,'2023-02-08 06:23:29','2023-02-08 06:23:29','37d04271-45c2-410c-849d-221ba3da1ec8'),(215,215,1,NULL,NULL,1,'2023-02-08 06:23:29','2023-02-08 06:23:29','51f7f51c-f09c-4652-a580-3b41258cd55c'),(216,216,1,NULL,NULL,1,'2023-02-08 06:23:29','2023-02-08 06:23:29','c95fe524-d445-4a72-957c-a2501fac1511'),(217,217,1,NULL,NULL,1,'2023-02-08 06:23:29','2023-02-08 06:23:29','df902b9f-901d-4c77-9458-7820b92c8368'),(218,218,1,NULL,NULL,1,'2023-02-08 06:23:29','2023-02-08 06:23:29','7d25bd3e-d4e4-4ddd-b77c-3ee72fa2ec20'),(219,219,1,NULL,NULL,1,'2023-02-08 06:23:30','2023-02-08 06:23:30','f4f1c8e4-c069-43c2-b048-f759f6018cb4'),(220,220,1,NULL,NULL,1,'2023-02-08 06:23:30','2023-02-08 06:23:30','1f588aae-205c-4f7a-820c-d3cd307aa6d1'),(221,221,1,NULL,NULL,1,'2023-02-08 06:23:30','2023-02-08 06:23:30','98d2f2a9-02a4-4b19-ab3d-3735457a37aa'),(222,222,1,NULL,NULL,1,'2023-02-08 06:23:30','2023-02-08 06:23:30','35871c71-3b62-4549-a18b-b1584256859d'),(223,223,1,NULL,NULL,1,'2023-02-08 06:23:30','2023-02-08 06:23:30','3b4b3fdf-2027-4a4e-a876-1a010170a3db'),(224,224,1,NULL,NULL,1,'2023-02-08 06:23:30','2023-02-08 06:23:30','24ebacc6-8699-4503-8b39-c3dc48348494'),(225,225,1,NULL,NULL,1,'2023-02-08 06:23:30','2023-02-08 06:23:30','ba25413f-69f6-4c4f-a6b4-c8d4375c118a'),(226,226,1,NULL,NULL,1,'2023-02-08 06:23:30','2023-02-08 06:23:30','90156a87-34be-462c-87b5-e62605f46db6'),(227,227,1,NULL,NULL,1,'2023-02-08 06:23:30','2023-02-08 06:23:30','6be3bb10-57f3-416b-b653-ee5da48b437a'),(228,228,1,NULL,NULL,1,'2023-02-08 06:23:30','2023-02-08 06:23:30','e4aa7f59-3d1e-44c9-badd-cc3a98b22949'),(229,229,1,NULL,NULL,1,'2023-02-08 06:23:30','2023-02-08 06:23:30','1d03f7f5-08f3-46de-8347-7a93995c2688'),(230,230,1,NULL,NULL,1,'2023-02-08 06:23:30','2023-02-08 06:23:30','c20f33e2-4978-46e9-b782-28fdb8e2f480'),(231,231,1,NULL,NULL,1,'2023-02-08 06:23:30','2023-02-08 06:23:30','820e74de-2b56-45a2-b009-79da44716590'),(232,232,1,NULL,NULL,1,'2023-02-08 06:23:30','2023-02-08 06:23:30','55c3dab8-3bf0-4e31-b43a-b420c93263f5'),(233,233,1,NULL,NULL,1,'2023-02-08 06:23:30','2023-02-08 06:23:30','51d4d727-094c-4c68-9e89-efda83f57983'),(234,234,1,NULL,NULL,1,'2023-02-08 06:23:30','2023-02-08 06:23:30','f1e819f4-279f-49a9-9905-651135cf53a1'),(235,235,1,NULL,NULL,1,'2023-02-08 06:23:30','2023-02-08 06:23:30','b7e001fd-4352-4592-aad4-f4d1c33eb326'),(236,236,1,NULL,NULL,1,'2023-02-08 06:23:30','2023-02-08 06:23:30','5c4c1c92-bc06-4eba-9386-a2b9bd6a2640'),(237,237,1,NULL,NULL,1,'2023-02-08 06:23:30','2023-02-08 06:23:30','f7144492-576b-414e-8fcd-814fb0619094'),(238,238,1,NULL,NULL,1,'2023-02-08 06:23:30','2023-02-08 06:23:30','7f092c2d-8d3f-4d1e-909d-bee6b71ca8ac'),(239,239,1,NULL,NULL,1,'2023-02-08 06:23:30','2023-02-08 06:23:30','41d5a66f-3d47-4402-bb24-3908cd81d293'),(240,240,1,NULL,NULL,1,'2023-02-08 06:23:30','2023-02-08 06:23:30','8b5df0b5-3f44-41e0-8a9a-6c192291d58e'),(241,241,1,NULL,NULL,1,'2023-02-08 06:23:30','2023-02-08 06:23:30','d2ee51aa-7384-4571-8010-074e8562565a'),(242,242,1,NULL,NULL,1,'2023-02-08 06:23:30','2023-02-08 06:23:30','eaf55c30-b608-4809-be09-dae9175efcb7'),(243,243,1,NULL,NULL,1,'2023-02-08 06:23:30','2023-02-08 06:23:30','0a5aa16d-5242-46d8-9dc8-8b74bd20e5e2'),(244,244,1,NULL,NULL,1,'2023-02-08 06:23:30','2023-02-08 06:23:30','489571f4-01e2-48b3-946b-d12b8f4f76a0'),(245,245,1,NULL,NULL,1,'2023-02-08 06:23:30','2023-02-08 06:23:30','d6a51d70-e9df-4012-9c87-333bf7ee3966'),(246,246,1,NULL,NULL,1,'2023-02-08 06:23:30','2023-02-08 06:23:30','412c3cff-4e9d-4836-a387-75a1c0006340'),(247,247,1,NULL,NULL,1,'2023-02-08 06:23:31','2023-02-08 06:23:31','0036800d-075c-4d41-8b88-634af5719319'),(248,248,1,NULL,NULL,1,'2023-02-08 06:23:31','2023-02-08 06:23:31','1180edae-626a-4214-8756-6aecb4d9dad1'),(249,249,1,NULL,NULL,1,'2023-02-08 06:23:31','2023-02-08 06:23:31','019074d7-7a5b-4f11-8dba-7e8bbdd07016'),(250,250,1,NULL,NULL,1,'2023-02-08 06:23:31','2023-02-08 06:23:31','cd525e1f-6f75-4956-827a-edfe3ba1f1a4'),(251,251,1,NULL,NULL,1,'2023-02-08 06:23:31','2023-02-08 06:23:31','5aa6b684-332f-4cc7-ad51-db3440424b06'),(252,252,1,NULL,NULL,1,'2023-02-08 06:23:31','2023-02-08 06:23:31','893ecc33-7d26-4dff-b84d-0b4bb7bec829'),(253,253,1,NULL,NULL,1,'2023-02-08 06:23:31','2023-02-08 06:23:31','793b91cf-2b96-4121-8976-94e3b5544cf1'),(254,254,1,NULL,NULL,1,'2023-02-08 06:23:31','2023-02-08 06:23:31','79ff872f-87df-43ae-99b2-92e7bd0e3252'),(255,255,1,NULL,NULL,1,'2023-02-08 06:23:31','2023-02-08 06:23:31','f9939fc2-6137-42a4-99e9-ee0f1a0f3a9f'),(256,256,1,NULL,NULL,1,'2023-02-08 06:23:31','2023-02-08 06:23:31','409785eb-3b8a-46e6-9b05-5111615506dc'),(257,257,1,NULL,NULL,1,'2023-02-08 06:23:31','2023-02-08 06:23:31','ea866756-86ac-4132-b1b1-623099d43e18'),(258,258,1,NULL,NULL,1,'2023-02-08 06:23:31','2023-02-08 06:23:31','07e31a59-3d3f-4435-b672-a798d7e93353'),(259,259,1,NULL,NULL,1,'2023-02-08 06:23:31','2023-02-08 06:23:31','0743940a-c14d-4e40-b7c6-8e315f55803d'),(260,260,1,NULL,NULL,1,'2023-02-08 06:23:31','2023-02-08 06:23:31','445e0c4a-0282-4458-bc20-3d09d08f8685'),(261,261,1,NULL,NULL,1,'2023-02-08 06:23:31','2023-02-08 06:23:31','479b9eed-8ca5-465a-bce8-814fcedc0c69'),(262,262,1,NULL,NULL,1,'2023-02-08 06:23:31','2023-02-08 06:23:31','d4f583e3-cd10-412b-a506-57e2f3760913'),(263,263,1,NULL,NULL,1,'2023-02-08 06:23:31','2023-02-08 06:23:31','880fb928-fac9-494f-a336-352811f05c03'),(264,264,1,NULL,NULL,1,'2023-02-08 06:23:31','2023-02-08 06:23:31','6c009c47-6d4f-4d1a-b0bf-6146761e46cc'),(265,265,1,NULL,NULL,1,'2023-02-08 06:23:31','2023-02-08 06:23:31','00e6952b-185c-46f0-ac6b-91211386415b'),(266,266,1,NULL,NULL,1,'2023-02-08 06:23:31','2023-02-08 06:23:31','28c157b1-213f-4d16-80b4-879ae1f237fe'),(267,267,1,NULL,NULL,1,'2023-02-08 06:23:31','2023-02-08 06:23:31','7a8d66df-4c44-483f-b55a-0fc9005ba2e9'),(268,268,1,NULL,NULL,1,'2023-02-08 06:23:31','2023-02-08 06:23:31','9ca14a2a-85bb-4e07-b04f-3dd67db61312'),(269,269,1,NULL,NULL,1,'2023-02-08 06:23:31','2023-02-08 06:23:31','ed57cf97-0375-4e1d-9973-a3a3771a6d42'),(270,270,1,NULL,NULL,1,'2023-02-08 06:23:31','2023-02-08 06:23:31','6d57eb18-63a6-44e6-b195-0a7b1bef397e'),(271,271,1,NULL,NULL,1,'2023-02-08 06:23:31','2023-02-08 06:23:31','ea4879a9-7e1f-45dc-b480-eaf1929f081a'),(272,272,1,NULL,NULL,1,'2023-02-08 06:23:31','2023-02-08 06:23:31','64e079ee-aaf6-4571-a07d-547c7d8448f4'),(273,273,1,NULL,NULL,1,'2023-02-08 06:23:31','2023-02-08 06:23:31','71298e71-ceb9-4d8f-8088-6727aed1d7fe'),(274,274,1,NULL,NULL,1,'2023-02-08 06:23:32','2023-02-08 06:23:32','25e57e1c-41b5-4ffc-80e1-080dc80637a6'),(275,275,1,NULL,NULL,1,'2023-02-08 06:23:32','2023-02-08 06:23:32','ea98b070-fc63-4210-b855-79eba7d41d00'),(276,276,1,NULL,NULL,1,'2023-02-08 06:23:32','2023-02-08 06:23:32','37572e3b-e637-43c8-aa5e-051cd69da86c'),(277,277,1,NULL,NULL,1,'2023-02-08 06:23:32','2023-02-08 06:23:32','28f62894-877b-421d-ad24-9c90fcf04341'),(278,278,1,NULL,NULL,1,'2023-02-08 06:23:32','2023-02-08 06:23:32','98e579b9-34c0-4cec-b75e-fad3e20d3942'),(279,279,1,NULL,NULL,1,'2023-02-08 06:23:32','2023-02-08 06:23:32','d04f9f38-d23b-42d3-95e2-4a287f6dddfc'),(280,280,1,NULL,NULL,1,'2023-02-08 06:23:32','2023-02-08 06:23:32','edcac955-e446-48f3-bcd5-533cc5795f63'),(281,281,1,NULL,NULL,1,'2023-02-08 06:23:32','2023-02-08 06:23:32','8ebdc6e5-568c-44f2-be4b-f8fa1a515c15'),(282,282,1,NULL,NULL,1,'2023-02-08 06:23:32','2023-02-08 06:23:32','f47eb838-de7f-4470-897a-c03f3b922bf7'),(283,283,1,NULL,NULL,1,'2023-02-08 06:23:32','2023-02-08 06:23:32','e2ca82fb-a219-4b24-a097-da81258f1717'),(284,284,1,NULL,NULL,1,'2023-02-08 06:23:32','2023-02-08 06:23:32','3b8c6a7b-adf3-4bcf-8c4e-6e13b34ea7f7'),(285,285,1,NULL,NULL,1,'2023-02-08 06:23:32','2023-02-08 06:23:32','54e0858c-25db-48eb-9f8f-8fc7e0bd877b'),(286,286,1,NULL,NULL,1,'2023-02-08 06:23:32','2023-02-08 06:23:32','07604a68-a154-43a9-85bb-19a2bc41a326'),(287,287,1,NULL,NULL,1,'2023-02-08 06:23:32','2023-02-08 06:23:32','81b94782-f248-4b25-af0f-22dac197123c'),(288,288,1,NULL,NULL,1,'2023-02-08 06:23:32','2023-02-08 06:23:32','35f7dfe2-f385-4b38-a284-dce01e3488de'),(289,289,1,NULL,NULL,1,'2023-02-08 06:23:32','2023-02-08 06:23:32','4e06485a-08d5-43f0-8164-7770096d80b2'),(290,290,1,NULL,NULL,1,'2023-02-08 06:23:32','2023-02-08 06:23:32','a9e2f716-d20f-4c49-9e3e-7a98d2f2e741'),(291,291,1,NULL,NULL,1,'2023-02-08 06:23:32','2023-02-08 06:23:32','609be40b-70aa-4782-97ee-b3fab7304b35'),(292,292,1,NULL,NULL,1,'2023-02-08 06:23:32','2023-02-08 06:23:32','1e560e7f-6b7c-4fbc-9872-594e043d1b66'),(293,293,1,NULL,NULL,1,'2023-02-08 06:23:32','2023-02-08 06:23:32','b03af570-b909-42cd-9e4f-770a1ce7d596'),(294,294,1,NULL,NULL,1,'2023-02-08 06:23:32','2023-02-08 06:23:32','c6519079-b11a-4bc2-913c-8c0213d7371c'),(295,295,1,NULL,NULL,1,'2023-02-08 06:23:32','2023-02-08 06:23:32','c0ff0e55-136a-4f07-baa8-3089a9f7099c'),(296,296,1,NULL,NULL,1,'2023-02-08 06:23:32','2023-02-08 06:23:32','6d0cbe88-9979-4ea9-9cd5-c9eb8b493aec'),(297,297,1,NULL,NULL,1,'2023-02-08 06:23:32','2023-02-08 06:23:32','ac1d36bb-3f03-4715-9c6f-e22e29e3fca7'),(298,298,1,NULL,NULL,1,'2023-02-08 06:23:33','2023-02-08 06:23:33','b7c4a7f7-37ba-4b09-89af-601e3d7f6752'),(299,299,1,NULL,NULL,1,'2023-02-08 06:23:33','2023-02-08 06:23:33','159bf1e7-97e1-4b31-811d-22717b6fad98'),(300,300,1,NULL,NULL,1,'2023-02-08 06:23:33','2023-02-08 06:23:33','244cf0d8-ddd4-4686-ab41-6f71cf2c4a06'),(301,301,1,NULL,NULL,1,'2023-02-08 06:23:33','2023-02-08 06:23:33','517e4fa9-a5ee-4a9c-b604-4777e54e46f2'),(302,302,1,NULL,NULL,1,'2023-02-08 06:23:33','2023-02-08 06:23:33','8ca4c29d-6ef6-4c8a-973f-d1a6cae6926b'),(303,303,1,NULL,NULL,1,'2023-02-08 06:23:33','2023-02-08 06:23:33','c13fc4aa-1668-401f-b42c-e1bb182a0ff2'),(304,304,1,NULL,NULL,1,'2023-02-08 06:23:33','2023-02-08 06:23:33','81977964-cbd5-4579-91a7-97ac669ac20e'),(305,305,1,NULL,NULL,1,'2023-02-08 06:23:33','2023-02-08 06:23:33','9b68d2cd-3391-4f62-bc13-5f34f8152f2b'),(306,306,1,NULL,NULL,1,'2023-02-08 06:23:33','2023-02-08 06:23:33','a9ffdb68-b77d-4abc-9ad9-033f32cd223f'),(307,307,1,NULL,NULL,1,'2023-02-08 06:23:33','2023-02-08 06:23:33','6a5ab161-0fdd-4d09-94d2-7b46ab6873b7'),(308,308,1,NULL,NULL,1,'2023-02-08 06:23:33','2023-02-08 06:23:33','f64fff6d-8023-4f5b-8583-47755e086b9d'),(309,309,1,NULL,NULL,1,'2023-02-08 06:23:33','2023-02-08 06:23:33','c6da136b-f964-4363-b564-3f90acd8d5f9'),(310,310,1,NULL,NULL,1,'2023-02-08 06:23:33','2023-02-08 06:23:33','221092bd-7ff9-4c38-bd8f-ba2bfeca5a05'),(311,311,1,NULL,NULL,1,'2023-02-08 06:23:34','2023-02-08 06:23:34','a748364b-4de3-445f-87a7-ccd6268c964e'),(312,312,1,NULL,NULL,1,'2023-02-08 06:23:34','2023-02-08 06:23:34','8f898e7e-d144-4390-884d-bb41a79e9534'),(313,313,1,NULL,NULL,1,'2023-02-08 06:23:34','2023-02-08 06:23:34','7b882190-6608-4b20-a9ee-cf12bf65cdc7'),(314,314,1,NULL,NULL,1,'2023-02-08 06:23:34','2023-02-08 06:23:34','3ac0a215-101f-4861-ac4f-7336f14479bb'),(315,315,1,NULL,NULL,1,'2023-02-08 06:23:34','2023-02-08 06:23:34','13ffaedc-9511-4941-a15c-c5c6afcb810a'),(316,316,1,NULL,NULL,1,'2023-02-08 06:23:34','2023-02-08 06:23:34','f508a27f-31f7-4513-9b61-d5e1cb99f732'),(317,317,1,NULL,NULL,1,'2023-02-08 06:23:34','2023-02-08 06:23:34','2f9a8c43-66bd-424e-85d2-83989f0c1774'),(318,318,1,NULL,NULL,1,'2023-02-08 06:23:34','2023-02-08 06:23:34','882fe7dd-0bd7-428f-b4eb-407dfc9a4b91'),(319,319,1,NULL,NULL,1,'2023-02-08 06:23:34','2023-02-08 06:23:34','b8c8aa7c-f359-43f2-b32a-3ae5ac60fb02'),(320,320,1,NULL,NULL,1,'2023-02-08 06:23:34','2023-02-08 06:23:34','44dcb885-2ced-4293-b8fd-aa727a52767d'),(321,321,1,NULL,NULL,1,'2023-02-08 06:23:34','2023-02-08 06:23:34','d8ba8465-eeee-496a-b9ef-a601f30cecb0'),(322,322,1,NULL,NULL,1,'2023-02-08 06:23:34','2023-02-08 06:23:34','003f3151-018b-4aa8-95f1-a9e5f82f7874'),(323,323,1,NULL,NULL,1,'2023-02-08 06:23:34','2023-02-08 06:23:34','5dfb954c-6a16-4b0e-99ff-ea65a52dd8bf'),(324,324,1,NULL,NULL,1,'2023-02-08 06:23:34','2023-02-08 06:23:34','17eb72b2-e841-4661-89c6-f6605ce31f84'),(325,325,1,NULL,NULL,1,'2023-02-08 06:23:34','2023-02-08 06:23:34','72863d20-fd54-4bb0-a04e-35938f004195'),(326,326,1,NULL,NULL,1,'2023-02-08 06:23:34','2023-02-08 06:23:34','87e1df0b-8b46-40b3-9da9-8ee5d9610576'),(327,327,1,NULL,NULL,1,'2023-02-08 06:23:34','2023-02-08 06:23:34','95da534b-b0b6-4f93-9a76-aaad492ea88b'),(328,328,1,NULL,NULL,1,'2023-02-08 06:23:34','2023-02-08 06:23:34','69d2a11d-fadd-4b0d-90ad-00fd94612955'),(329,329,1,NULL,NULL,1,'2023-02-08 06:23:34','2023-02-08 06:23:34','78a201de-9f9a-42bf-9280-5fde8e5aa5e8'),(330,330,1,NULL,NULL,1,'2023-02-08 06:23:34','2023-02-08 06:23:34','33adf069-51b3-4f96-866b-a8e3d2fe7517'),(331,331,1,NULL,NULL,1,'2023-02-08 06:23:34','2023-02-08 06:23:34','992431d9-1263-440e-934d-5a30665204a5'),(332,332,1,NULL,NULL,1,'2023-02-08 06:23:35','2023-02-08 06:23:35','37d86817-6a67-4957-a5c2-53e590b37660'),(333,333,1,NULL,NULL,1,'2023-02-08 06:23:35','2023-02-08 06:23:35','6760b1f6-6cbb-4832-a602-af635b8ec744'),(334,334,1,NULL,NULL,1,'2023-02-08 06:23:35','2023-02-08 06:23:35','3de0928a-6b06-4b92-8a4a-6ac3ccf6c781'),(335,335,1,NULL,NULL,1,'2023-02-08 06:23:35','2023-02-08 06:23:35','2e868317-265e-44d2-bf51-e0629abcfdfd'),(336,336,1,NULL,NULL,1,'2023-02-08 06:23:35','2023-02-08 06:23:35','c63b09b7-abba-478d-81b1-704860f11a0f'),(337,337,1,NULL,NULL,1,'2023-02-08 06:23:35','2023-02-08 06:23:35','76c08f41-5fdc-4651-9680-f28eeb6078cf'),(338,338,1,NULL,NULL,1,'2023-02-08 06:23:35','2023-02-08 06:23:35','ccbcd4a7-2306-424f-bf60-b459d65bf032'),(339,339,1,NULL,NULL,1,'2023-02-08 06:23:35','2023-02-08 06:23:35','8fbac107-ab84-42e0-a137-cb2c93d79916'),(340,340,1,NULL,NULL,1,'2023-02-08 06:23:35','2023-02-08 06:23:35','29218918-2102-465e-8f64-b73328c063be'),(341,341,1,NULL,NULL,1,'2023-02-08 06:23:35','2023-02-08 06:23:35','efe4ff09-04f9-4363-ad83-5703d7ebd178'),(342,342,1,NULL,NULL,1,'2023-02-08 06:23:35','2023-02-08 06:23:35','f3c8ddb1-049b-4b9d-8514-818e6737dce3'),(343,343,1,NULL,NULL,1,'2023-02-08 06:23:35','2023-02-08 06:23:35','5d1978f2-7b8a-4463-b0c7-846c038961d6'),(344,344,1,NULL,NULL,1,'2023-02-08 06:23:35','2023-02-08 06:23:35','9230f6ca-e7b3-4bce-b00d-e12f7df03bb2'),(345,345,1,NULL,NULL,1,'2023-02-08 06:23:35','2023-02-08 06:23:35','45409a85-4391-4520-9c75-ac02d5dae6d0'),(346,346,1,NULL,NULL,1,'2023-02-08 06:23:35','2023-02-08 06:23:35','b15402a7-66e2-4b04-8e9e-60387b72fea2'),(347,347,1,NULL,NULL,1,'2023-02-08 06:23:35','2023-02-08 06:23:35','a5e6204b-5fee-4b07-bf92-2214ce8e96b1'),(348,348,1,NULL,NULL,1,'2023-02-08 06:23:35','2023-02-08 06:23:35','9aa28728-1943-4f0a-8991-f12b3f6f5efc'),(349,349,1,NULL,NULL,1,'2023-02-08 06:23:35','2023-02-08 06:23:35','47dbbc21-b689-463f-8377-3073154a9bd4'),(350,350,1,NULL,NULL,1,'2023-02-08 06:23:35','2023-02-08 06:23:35','268e72bf-6455-4905-867b-05f171b86c15'),(351,351,1,NULL,NULL,1,'2023-02-08 06:23:35','2023-02-08 06:23:35','bf4826ae-fd73-42e7-b623-80078a4706c2'),(352,352,1,NULL,NULL,1,'2023-02-08 06:23:35','2023-02-08 06:23:35','7a385f0c-bfbc-43fb-ace3-cb207b0a59fa'),(353,353,1,NULL,NULL,1,'2023-02-08 06:23:35','2023-02-08 06:23:35','1ab39874-de0d-4410-92b0-04ca00232002'),(354,354,1,NULL,NULL,1,'2023-02-08 06:23:35','2023-02-08 06:23:35','570cf34e-b010-45bd-ad00-5a06bbfa1e28'),(355,355,1,NULL,NULL,1,'2023-02-08 06:23:35','2023-02-08 06:23:35','070e7804-0021-41e2-bd66-ad0a9d8aab5f'),(356,356,1,NULL,NULL,1,'2023-02-08 06:23:35','2023-02-08 06:23:35','cd2f8bc6-cbd2-4196-b46f-782cb41fbc21'),(357,357,1,NULL,NULL,1,'2023-02-08 06:23:35','2023-02-08 06:23:35','c3953c8b-ae5d-4582-80ca-74d6d2135814'),(358,358,1,NULL,NULL,1,'2023-02-08 06:23:36','2023-02-08 06:23:36','eeba3e8d-1613-4b8b-a50e-1c6e0e8a8d1d'),(359,359,1,NULL,NULL,1,'2023-02-08 06:23:36','2023-02-08 06:23:36','f916e3f2-4f17-4333-a512-2eeaa8a15d01'),(360,360,1,NULL,NULL,1,'2023-02-08 06:23:36','2023-02-08 06:23:36','a47b3660-c427-4d54-8896-e4cdb6293f2c'),(361,361,1,NULL,NULL,1,'2023-02-08 06:23:36','2023-02-08 06:23:36','98122453-ad3b-4aff-8132-bd06b8cd0304'),(362,362,1,NULL,NULL,1,'2023-02-08 06:23:36','2023-02-08 06:23:36','9b8586f0-326c-4685-8b4b-d466152c6836'),(363,363,1,NULL,NULL,1,'2023-02-08 06:23:36','2023-02-08 06:23:36','d4b3c7c4-fed2-481f-b99b-6fc87517fa98'),(364,364,1,NULL,NULL,1,'2023-02-08 06:23:36','2023-02-08 06:23:36','390b7045-39ce-4f90-a50c-255e8026df43'),(365,365,1,NULL,NULL,1,'2023-02-08 06:23:36','2023-02-08 06:23:36','d2e396e9-98a8-4789-9be3-36c6c8c1b0c0'),(366,366,1,NULL,NULL,1,'2023-02-08 06:23:36','2023-02-08 06:23:36','de537308-f423-446f-a26b-1c4c76f4fa12'),(367,367,1,NULL,NULL,1,'2023-02-08 06:23:36','2023-02-08 06:23:36','65cef997-9623-4570-8827-43dd3a4b33da'),(368,368,1,NULL,NULL,1,'2023-02-08 06:23:36','2023-02-08 06:23:36','4296ca1e-8476-4deb-a65d-593d685cb436'),(369,369,1,NULL,NULL,1,'2023-02-08 06:23:36','2023-02-08 06:23:36','d00d552f-b43e-4e91-b473-9b0c5bf4af1c'),(370,370,1,NULL,NULL,1,'2023-02-08 06:23:36','2023-02-08 06:23:36','8d7e52b1-11cb-4c86-8aec-33b52312d621'),(371,371,1,NULL,NULL,1,'2023-02-08 06:23:36','2023-02-08 06:23:36','affe1029-25a7-4287-aa4b-263a194d0426'),(372,372,1,NULL,NULL,1,'2023-02-08 06:23:36','2023-02-08 06:23:36','5fdd8401-d6e5-4fe4-8a1c-393c88d569b8'),(373,373,1,NULL,NULL,1,'2023-02-08 06:23:36','2023-02-08 06:23:36','e315c9aa-5b7b-4798-8525-00f46bdd13aa'),(374,374,1,NULL,NULL,1,'2023-02-08 06:23:36','2023-02-08 06:23:36','1db2718a-b1f2-44f4-82ec-46077b29d1a5'),(375,375,1,NULL,NULL,1,'2023-02-08 06:23:37','2023-02-08 06:23:37','81187d2f-5f61-4b95-9f85-c07cbcf75b9d'),(376,376,1,NULL,NULL,1,'2023-02-08 06:23:37','2023-02-08 06:23:37','04c9fb35-34ca-4fe3-bfa9-8d5a8d18503a'),(377,377,1,NULL,NULL,1,'2023-02-08 06:23:37','2023-02-08 06:23:37','cdb056e7-9d76-4293-a140-dda81427e57d'),(378,378,1,NULL,NULL,1,'2023-02-08 06:23:37','2023-02-08 06:23:37','1565c2b1-6720-416d-8ca3-35d954c2a471'),(379,379,1,NULL,NULL,1,'2023-02-08 06:23:37','2023-02-08 06:23:37','c7ec7a0d-f10e-4555-b0fc-8ff4e6a75ef5'),(380,380,1,NULL,NULL,1,'2023-02-08 06:23:37','2023-02-08 06:23:37','6356d00c-0dd2-4e5d-82ba-f539aef9f236'),(381,381,1,NULL,NULL,1,'2023-02-08 06:23:37','2023-02-08 06:23:37','da58a77e-e09e-42a3-a719-2670e76460b9'),(382,382,1,NULL,NULL,1,'2023-02-08 06:23:37','2023-02-08 06:23:37','c6a4a05d-beba-4daf-ad6e-360cd011e01c'),(383,383,1,NULL,NULL,1,'2023-02-08 06:23:37','2023-02-08 06:23:37','e74962ba-2b2c-46ac-8cc1-0e18a8e17c9b'),(384,384,1,NULL,NULL,1,'2023-02-08 06:23:37','2023-02-08 06:23:37','e06c9421-b9d0-4c47-8311-6b8d17d30970'),(385,385,1,NULL,NULL,1,'2023-02-08 06:23:37','2023-02-08 06:23:37','e6b1e000-e5cc-4af5-b648-fdbc1948d44d'),(386,386,1,NULL,NULL,1,'2023-02-08 06:23:37','2023-02-08 06:23:37','90ba7bc5-c196-4bd7-a21d-87b0fc5b4441'),(387,387,1,NULL,NULL,1,'2023-02-08 06:23:37','2023-02-08 06:23:37','84c4c4a9-5b76-46dc-a7ce-14636225d9a0'),(388,388,1,NULL,NULL,1,'2023-02-08 06:23:37','2023-02-08 06:23:37','b319279f-849b-4334-b329-eae3411b97b5'),(389,389,1,NULL,NULL,1,'2023-02-08 06:23:38','2023-02-08 06:23:38','34425e9d-a835-4664-b059-cc71c4fd1ae3'),(390,390,1,NULL,NULL,1,'2023-02-08 06:23:38','2023-02-08 06:23:38','3357ff20-b92e-4bd0-8f9d-4b78cbc4bcbd'),(391,391,1,NULL,NULL,1,'2023-02-08 06:23:38','2023-02-08 06:23:38','0ac96609-206f-47b5-a2e3-3c1ad32dcf00'),(392,392,1,NULL,NULL,1,'2023-02-08 06:23:38','2023-02-08 06:23:38','51e1a808-57dc-43ac-9105-7a90a67e307e'),(393,393,1,NULL,NULL,1,'2023-02-08 06:23:38','2023-02-08 06:23:38','91643ce4-e650-4083-a047-7770928782ef'),(394,394,1,NULL,NULL,1,'2023-02-08 06:23:38','2023-02-08 06:23:38','dfdc2a37-6075-4246-ab03-6ed0d4c7f4f7'),(395,395,1,NULL,NULL,1,'2023-02-08 06:23:38','2023-02-08 06:23:38','aaf08f83-a349-45ac-85bc-7438b17bf248'),(396,396,1,NULL,NULL,1,'2023-02-08 06:23:38','2023-02-08 06:23:38','2a14cbe5-5fd0-4362-bf8a-9620d495d0de'),(397,397,1,NULL,NULL,1,'2023-02-08 06:23:38','2023-02-08 06:23:38','b9412c69-6459-4326-acbd-42f44ffd5611'),(398,398,1,NULL,NULL,1,'2023-02-08 06:23:38','2023-02-08 06:23:38','8eb85c0d-5b1c-48aa-a73d-2487db641b5f'),(399,399,1,NULL,NULL,1,'2023-02-08 06:24:50','2023-02-08 06:24:50','70c9bfbd-cee7-4cc1-9c1a-5552198935b2'),(400,400,1,NULL,NULL,1,'2023-02-08 06:29:24','2023-02-08 06:29:24','1c284b05-3d38-430b-9036-11300c1fce5a'),(401,401,1,NULL,NULL,1,'2023-02-08 06:31:39','2023-02-08 06:31:39','f30e3bc3-80a0-4e19-bdc4-7bf8688148c6');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldgroups`
--

LOCK TABLES `fieldgroups` WRITE;
/*!40000 ALTER TABLE `fieldgroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldgroups` VALUES (1,'Common','2023-02-02 05:28:23','2023-02-02 05:28:23',NULL,'31006d4c-2f40-498c-9a4c-69cff4fd4279');
/*!40000 ALTER TABLE `fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayoutfields`
--

LOCK TABLES `fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `fieldlayoutfields` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouts` VALUES (1,'craft\\elements\\Asset','2023-02-08 03:29:07','2023-02-08 03:29:07','2023-02-08 03:42:36','5f1c02fa-d379-448f-8af2-eed35386b20d'),(2,'craft\\elements\\Asset','2023-02-08 03:43:40','2023-02-08 03:43:40','2023-02-08 05:14:43','599f7b0e-cafa-489b-b6e3-dcce5d5bcae7'),(3,'craft\\elements\\Asset','2023-02-08 06:11:59','2023-02-08 06:11:59','2023-02-08 14:19:31','218106e4-98a6-41ec-91cd-2a7dc8305f5d');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouttabs`
--

LOCK TABLES `fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `fieldlayouttabs` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouttabs` VALUES (1,1,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"58b25919-4f6f-498c-8db7-ddccdb5dfd84\",\"userCondition\":null,\"elementCondition\":null}]',1,'2023-02-08 03:29:07','2023-02-08 03:29:07','d92a148c-aba9-4fb0-82cd-04ec118e579b'),(2,2,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"20eb77c2-ba4f-42cd-a501-6ec5bc841b42\",\"userCondition\":null,\"elementCondition\":null}]',1,'2023-02-08 03:43:40','2023-02-08 03:43:40','e04b62b7-a802-453b-bf6f-01922bd786a6'),(3,3,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"fc07b11f-c2cc-4627-81ea-4169617381a8\",\"userCondition\":null,\"elementCondition\":null}]',1,'2023-02-08 06:11:59','2023-02-08 06:11:59','c353f4cf-8b65-48eb-9df0-aacdd6deefb3');
/*!40000 ALTER TABLE `fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `imagetransforms`
--

LOCK TABLES `imagetransforms` WRITE;
/*!40000 ALTER TABLE `imagetransforms` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `imagetransforms` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `info` VALUES (1,'4.3.10','4.0.0.9',0,'xqqgervoelhw','3@tylawohvfc','2023-02-02 05:28:23','2023-02-18 03:25:01','876de66d-7fde-40c5-b8b8-c4713c00d927');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocks`
--

LOCK TABLES `matrixblocks` WRITE;
/*!40000 ALTER TABLE `matrixblocks` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocks_owners`
--

LOCK TABLES `matrixblocks_owners` WRITE;
/*!40000 ALTER TABLE `matrixblocks_owners` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `matrixblocks_owners` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocktypes`
--

LOCK TABLES `matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `matrixblocktypes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `migrations` VALUES (1,'craft','Install','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','32ccba4d-556b-4fcd-9e7c-73a2e60aed4d'),(2,'craft','m210121_145800_asset_indexing_changes','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','110963d6-acbc-4052-ba24-5343051e4663'),(3,'craft','m210624_222934_drop_deprecated_tables','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','09e2ddd5-cb53-449a-bb38-f233c1571174'),(4,'craft','m210724_180756_rename_source_cols','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','ecb98123-06eb-4d65-9dae-588f920f5d1b'),(5,'craft','m210809_124211_remove_superfluous_uids','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','4de6ac73-1c13-4a53-8eaf-565ed1117d92'),(6,'craft','m210817_014201_universal_users','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','130028a6-a406-4471-96fb-6758b9525b0e'),(7,'craft','m210904_132612_store_element_source_settings_in_project_config','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','4b37ada2-81f1-4985-b0e5-e674b34e2968'),(8,'craft','m211115_135500_image_transformers','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','34b2fc16-745c-42d5-b4fb-e7ffbc312d7b'),(9,'craft','m211201_131000_filesystems','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','aca6e315-e112-496c-ba73-6e19bb36b7f3'),(10,'craft','m220103_043103_tab_conditions','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','8aa8b2fe-a585-4c84-8e23-1b3045b48e7a'),(11,'craft','m220104_003433_asset_alt_text','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','51804ab1-3c62-442e-a212-6fb539d779d5'),(12,'craft','m220123_213619_update_permissions','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','72bd9363-4be6-4094-bc55-b0aaf45b391b'),(13,'craft','m220126_003432_addresses','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','beb0b304-1443-4ca0-92e2-e2a93c99298f'),(14,'craft','m220209_095604_add_indexes','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','014c11d1-9f1b-4af9-b67b-6252d934ac91'),(15,'craft','m220213_015220_matrixblocks_owners_table','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','25e7db17-b5f4-470a-adf0-dae78569929b'),(16,'craft','m220214_000000_truncate_sessions','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','1451ff20-81bc-4270-890e-76ab3ede9c1c'),(17,'craft','m220222_122159_full_names','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','582ce54c-5d9d-42e4-a7ed-f01688cdc688'),(18,'craft','m220223_180559_nullable_address_owner','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','b95f7ab9-3df4-4bd2-bb9c-63a725405fa2'),(19,'craft','m220225_165000_transform_filesystems','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','04098051-2cc1-4706-96fc-6bd2af52dce4'),(20,'craft','m220309_152006_rename_field_layout_elements','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','ef9220f2-be58-466a-b464-dfa3a1c56e5d'),(21,'craft','m220314_211928_field_layout_element_uids','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','e1788361-9335-4b86-b917-08bbcab2cadb'),(22,'craft','m220316_123800_transform_fs_subpath','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','ac64d940-5a66-4f42-963d-0b31a660e0bd'),(23,'craft','m220317_174250_release_all_jobs','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','aa45919d-0094-40b9-9b56-12243f138a81'),(24,'craft','m220330_150000_add_site_gql_schema_components','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','15f9020e-4c57-4f00-a078-78245121f93f'),(25,'craft','m220413_024536_site_enabled_string','2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-02 05:28:24','f7899074-4588-4744-be09-408addd05e81');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `projectconfig` VALUES ('dateModified','1675658606'),('email.fromEmail','\"info@putyourlightson.net\"'),('email.fromName','\"Craft Coding Challenge\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('fieldGroups.31006d4c-2f40-498c-9a4c-69cff4fd4279.name','\"Common\"'),('graphql.publicToken.enabled','false'),('graphql.publicToken.expiryDate','null'),('meta.__names__.0779f354-f5d2-4f82-9a36-28a252f70ce4','\"Public Schema\"'),('meta.__names__.0d89c679-f6f5-42ae-8341-4bea917c6af7','\"$CRAFT_SITE_NAME\"'),('meta.__names__.31006d4c-2f40-498c-9a4c-69cff4fd4279','\"Common\"'),('meta.__names__.b55012be-3f7f-4150-b59c-5a6623c00743','\"Public Schema\"'),('meta.__names__.c7c2807b-84cc-4e1f-9279-af044bc0b472','\"Public Schema\"'),('meta.__names__.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6','\"$CRAFT_SITE_NAME\"'),('siteGroups.0d89c679-f6f5-42ae-8341-4bea917c6af7.name','\"$CRAFT_SITE_NAME\"'),('sites.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.baseUrl','\"$PRIMARY_SITE_URL\"'),('sites.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.enabled','true'),('sites.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.handle','\"default\"'),('sites.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.hasUrls','true'),('sites.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.language','\"en-US\"'),('sites.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.name','\"$CRAFT_SITE_NAME\"'),('sites.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.primary','true'),('sites.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.siteGroup','\"0d89c679-f6f5-42ae-8341-4bea917c6af7\"'),('sites.f255ef6d-0c55-4bdc-9ced-f610bbb3bed6.sortOrder','1'),('system.edition','\"pro\"'),('system.live','true'),('system.name','\"$CRAFT_SITE_NAME\"'),('system.retryDuration','null'),('system.schemaVersion','\"4.0.0.9\"'),('system.timeZone','\"America/Los_Angeles\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.requireEmailVerification','true');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `searchindex` VALUES (1,'email',0,1,' info putyourlightson net '),(1,'firstname',0,1,''),(1,'fullname',0,1,''),(1,'lastname',0,1,''),(1,'slug',0,1,''),(1,'username',0,1,' admin '),(2,'extension',0,1,' jpeg '),(2,'filename',0,1,' rami jpeg '),(2,'kind',0,1,' image '),(2,'slug',0,1,''),(2,'title',0,1,' rami '),(3,'extension',0,1,' jpeg '),(3,'filename',0,1,' rami jpeg '),(3,'kind',0,1,' image '),(3,'slug',0,1,''),(3,'title',0,1,' rami '),(4,'extension',0,1,' js '),(4,'filename',0,1,' dashboard js '),(4,'kind',0,1,' javascript '),(4,'slug',0,1,''),(4,'title',0,1,' dashboard '),(5,'extension',0,1,' txt '),(5,'filename',0,1,' xregexp all js license txt '),(5,'kind',0,1,' text '),(5,'slug',0,1,''),(5,'title',0,1,' xregexp all js license '),(6,'extension',0,1,' js '),(6,'filename',0,1,' xregexp all js '),(6,'kind',0,1,' javascript '),(6,'slug',0,1,''),(6,'title',0,1,' xregexp all '),(7,'extension',0,1,' js '),(7,'filename',0,1,' htmx min js '),(7,'kind',0,1,' javascript '),(7,'slug',0,1,''),(7,'title',0,1,' htmx min '),(8,'extension',0,1,' json '),(8,'filename',0,1,' ar om json '),(8,'kind',0,1,' json '),(8,'slug',0,1,''),(8,'title',0,1,' ar om '),(9,'extension',0,1,' json '),(9,'filename',0,1,' uk ua json '),(9,'kind',0,1,' json '),(9,'slug',0,1,''),(9,'title',0,1,' uk ua '),(10,'extension',0,1,' json '),(10,'filename',0,1,' ar qa json '),(10,'kind',0,1,' json '),(10,'slug',0,1,''),(10,'title',0,1,' ar qa '),(11,'extension',0,1,' json '),(11,'filename',0,1,' es bo json '),(11,'kind',0,1,' json '),(11,'slug',0,1,''),(11,'title',0,1,' es bo '),(12,'extension',0,1,' json '),(12,'filename',0,1,' en us json '),(12,'kind',0,1,' json '),(12,'slug',0,1,''),(12,'title',0,1,' en us '),(13,'extension',0,1,' json '),(13,'filename',0,1,' ru ru json '),(13,'kind',0,1,' json '),(13,'slug',0,1,''),(13,'title',0,1,' ru ru '),(14,'extension',0,1,' json '),(14,'filename',0,1,' ar ye json '),(14,'kind',0,1,' json '),(14,'slug',0,1,''),(14,'title',0,1,' ar ye '),(15,'extension',0,1,' json '),(15,'filename',0,1,' ar ps json '),(15,'kind',0,1,' json '),(15,'slug',0,1,''),(15,'title',0,1,' ar ps '),(16,'extension',0,1,' json '),(16,'filename',0,1,' pt br json '),(16,'kind',0,1,' json '),(16,'slug',0,1,''),(16,'title',0,1,' pt br '),(17,'extension',0,1,' json '),(17,'filename',0,1,' ar kw json '),(17,'kind',0,1,' json '),(17,'slug',0,1,''),(17,'title',0,1,' ar kw '),(18,'extension',0,1,' json '),(18,'filename',0,1,' pl pl json '),(18,'kind',0,1,' json '),(18,'slug',0,1,''),(18,'title',0,1,' pl pl '),(19,'extension',0,1,' json '),(19,'filename',0,1,' ar sd json '),(19,'kind',0,1,' json '),(19,'slug',0,1,''),(19,'title',0,1,' ar sd '),(20,'extension',0,1,' json '),(20,'filename',0,1,' ar 001 json '),(20,'kind',0,1,' json '),(20,'slug',0,1,''),(20,'title',0,1,' ar 001 '),(21,'extension',0,1,' json '),(21,'filename',0,1,' ar mr json '),(21,'kind',0,1,' json '),(21,'slug',0,1,''),(21,'title',0,1,' ar mr '),(22,'extension',0,1,' json '),(22,'filename',0,1,' hu hu json '),(22,'kind',0,1,' json '),(22,'slug',0,1,''),(22,'title',0,1,' hu hu '),(23,'extension',0,1,' json '),(23,'filename',0,1,' en gb json '),(23,'kind',0,1,' json '),(23,'slug',0,1,''),(23,'title',0,1,' en gb '),(24,'extension',0,1,' json '),(24,'filename',0,1,' en ca json '),(24,'kind',0,1,' json '),(24,'slug',0,1,''),(24,'title',0,1,' en ca '),(25,'extension',0,1,' json '),(25,'filename',0,1,' ar er json '),(25,'kind',0,1,' json '),(25,'slug',0,1,''),(25,'title',0,1,' ar er '),(26,'extension',0,1,' json '),(26,'filename',0,1,' nl nl json '),(26,'kind',0,1,' json '),(26,'slug',0,1,''),(26,'title',0,1,' nl nl '),(27,'extension',0,1,' json '),(27,'filename',0,1,' es mx json '),(27,'kind',0,1,' json '),(27,'slug',0,1,''),(27,'title',0,1,' es mx '),(28,'extension',0,1,' json '),(28,'filename',0,1,' sv se json '),(28,'kind',0,1,' json '),(28,'slug',0,1,''),(28,'title',0,1,' sv se '),(29,'extension',0,1,' json '),(29,'filename',0,1,' ar lb json '),(29,'kind',0,1,' json '),(29,'slug',0,1,''),(29,'title',0,1,' ar lb '),(30,'extension',0,1,' json '),(30,'filename',0,1,' ar jo json '),(30,'kind',0,1,' json '),(30,'slug',0,1,''),(30,'title',0,1,' ar jo '),(31,'extension',0,1,' json '),(31,'filename',0,1,' fi fi json '),(31,'kind',0,1,' json '),(31,'slug',0,1,''),(31,'title',0,1,' fi fi '),(32,'extension',0,1,' json '),(32,'filename',0,1,' zh cn json '),(32,'kind',0,1,' json '),(32,'slug',0,1,''),(32,'title',0,1,' zh cn '),(33,'extension',0,1,' json '),(33,'filename',0,1,' ja jp json '),(33,'kind',0,1,' json '),(33,'slug',0,1,''),(33,'title',0,1,' ja jp '),(34,'extension',0,1,' json '),(34,'filename',0,1,' ar so json '),(34,'kind',0,1,' json '),(34,'slug',0,1,''),(34,'title',0,1,' ar so '),(35,'extension',0,1,' json '),(35,'filename',0,1,' en in json '),(35,'kind',0,1,' json '),(35,'slug',0,1,''),(35,'title',0,1,' en in '),(36,'extension',0,1,' json '),(36,'filename',0,1,' es es json '),(36,'kind',0,1,' json '),(36,'slug',0,1,''),(36,'title',0,1,' es es '),(37,'extension',0,1,' json '),(37,'filename',0,1,' ar tn json '),(37,'kind',0,1,' json '),(37,'slug',0,1,''),(37,'title',0,1,' ar tn '),(38,'extension',0,1,' json '),(38,'filename',0,1,' fr fr json '),(38,'kind',0,1,' json '),(38,'slug',0,1,''),(38,'title',0,1,' fr fr '),(39,'extension',0,1,' json '),(39,'filename',0,1,' he il json '),(39,'kind',0,1,' json '),(39,'slug',0,1,''),(39,'title',0,1,' he il '),(40,'extension',0,1,' json '),(40,'filename',0,1,' ar eg json '),(40,'kind',0,1,' json '),(40,'slug',0,1,''),(40,'title',0,1,' ar eg '),(41,'extension',0,1,' json '),(41,'filename',0,1,' en ie json '),(41,'kind',0,1,' json '),(41,'slug',0,1,''),(41,'title',0,1,' en ie '),(42,'extension',0,1,' json '),(42,'filename',0,1,' mk mk json '),(42,'kind',0,1,' json '),(42,'slug',0,1,''),(42,'title',0,1,' mk mk '),(43,'extension',0,1,' json '),(43,'filename',0,1,' ar ly json '),(43,'kind',0,1,' json '),(43,'slug',0,1,''),(43,'title',0,1,' ar ly '),(44,'extension',0,1,' json '),(44,'filename',0,1,' ar iq json '),(44,'kind',0,1,' json '),(44,'slug',0,1,''),(44,'title',0,1,' ar iq '),(45,'extension',0,1,' json '),(45,'filename',0,1,' ar ma json '),(45,'kind',0,1,' json '),(45,'slug',0,1,''),(45,'title',0,1,' ar ma '),(46,'extension',0,1,' json '),(46,'filename',0,1,' cs cz json '),(46,'kind',0,1,' json '),(46,'slug',0,1,''),(46,'title',0,1,' cs cz '),(47,'extension',0,1,' json '),(47,'filename',0,1,' de de json '),(47,'kind',0,1,' json '),(47,'slug',0,1,''),(47,'title',0,1,' de de '),(48,'extension',0,1,' json '),(48,'filename',0,1,' ar sa json '),(48,'kind',0,1,' json '),(48,'slug',0,1,''),(48,'title',0,1,' ar sa '),(49,'extension',0,1,' json '),(49,'filename',0,1,' fr ca json '),(49,'kind',0,1,' json '),(49,'slug',0,1,''),(49,'title',0,1,' fr ca '),(50,'extension',0,1,' json '),(50,'filename',0,1,' ar dz json '),(50,'kind',0,1,' json '),(50,'slug',0,1,''),(50,'title',0,1,' ar dz '),(51,'extension',0,1,' json '),(51,'filename',0,1,' ar sy json '),(51,'kind',0,1,' json '),(51,'slug',0,1,''),(51,'title',0,1,' ar sy '),(52,'extension',0,1,' json '),(52,'filename',0,1,' ar eh json '),(52,'kind',0,1,' json '),(52,'slug',0,1,''),(52,'title',0,1,' ar eh '),(53,'extension',0,1,' json '),(53,'filename',0,1,' ko kr json '),(53,'kind',0,1,' json '),(53,'slug',0,1,''),(53,'title',0,1,' ko kr '),(54,'extension',0,1,' json '),(54,'filename',0,1,' de ch json '),(54,'kind',0,1,' json '),(54,'slug',0,1,''),(54,'title',0,1,' de ch '),(55,'extension',0,1,' json '),(55,'filename',0,1,' ar bh json '),(55,'kind',0,1,' json '),(55,'slug',0,1,''),(55,'title',0,1,' ar bh '),(56,'extension',0,1,' json '),(56,'filename',0,1,' it it json '),(56,'kind',0,1,' json '),(56,'slug',0,1,''),(56,'title',0,1,' it it '),(57,'extension',0,1,' json '),(57,'filename',0,1,' ar ss json '),(57,'kind',0,1,' json '),(57,'slug',0,1,''),(57,'title',0,1,' ar ss '),(58,'extension',0,1,' json '),(58,'filename',0,1,' ar dj json '),(58,'kind',0,1,' json '),(58,'slug',0,1,''),(58,'title',0,1,' ar dj '),(59,'extension',0,1,' json '),(59,'filename',0,1,' ar il json '),(59,'kind',0,1,' json '),(59,'slug',0,1,''),(59,'title',0,1,' ar il '),(60,'extension',0,1,' json '),(60,'filename',0,1,' ar ae json '),(60,'kind',0,1,' json '),(60,'slug',0,1,''),(60,'title',0,1,' ar ae '),(61,'extension',0,1,' json '),(61,'filename',0,1,' ar td json '),(61,'kind',0,1,' json '),(61,'slug',0,1,''),(61,'title',0,1,' ar td '),(62,'extension',0,1,' json '),(62,'filename',0,1,' ar km json '),(62,'kind',0,1,' json '),(62,'slug',0,1,''),(62,'title',0,1,' ar km '),(63,'extension',0,1,' json '),(63,'filename',0,1,' ca es json '),(63,'kind',0,1,' json '),(63,'slug',0,1,''),(63,'title',0,1,' ca es '),(64,'extension',0,1,' json '),(64,'filename',0,1,' uk ua json '),(64,'kind',0,1,' json '),(64,'slug',0,1,''),(64,'title',0,1,' uk ua '),(65,'extension',0,1,' json '),(65,'filename',0,1,' en us json '),(65,'kind',0,1,' json '),(65,'slug',0,1,''),(65,'title',0,1,' en us '),(66,'extension',0,1,' json '),(66,'filename',0,1,' ru ru json '),(66,'kind',0,1,' json '),(66,'slug',0,1,''),(66,'title',0,1,' ru ru '),(67,'extension',0,1,' json '),(67,'filename',0,1,' pt br json '),(67,'kind',0,1,' json '),(67,'slug',0,1,''),(67,'title',0,1,' pt br '),(68,'extension',0,1,' json '),(68,'filename',0,1,' pl pl json '),(68,'kind',0,1,' json '),(68,'slug',0,1,''),(68,'title',0,1,' pl pl '),(69,'extension',0,1,' json '),(69,'filename',0,1,' hu hu json '),(69,'kind',0,1,' json '),(69,'slug',0,1,''),(69,'title',0,1,' hu hu '),(70,'extension',0,1,' json '),(70,'filename',0,1,' en gb json '),(70,'kind',0,1,' json '),(70,'slug',0,1,''),(70,'title',0,1,' en gb '),(71,'extension',0,1,' json '),(71,'filename',0,1,' en ca json '),(71,'kind',0,1,' json '),(71,'slug',0,1,''),(71,'title',0,1,' en ca '),(72,'extension',0,1,' json '),(72,'filename',0,1,' nl nl json '),(72,'kind',0,1,' json '),(72,'slug',0,1,''),(72,'title',0,1,' nl nl '),(73,'extension',0,1,' json '),(73,'filename',0,1,' es mx json '),(73,'kind',0,1,' json '),(73,'slug',0,1,''),(73,'title',0,1,' es mx '),(74,'extension',0,1,' json '),(74,'filename',0,1,' sv se json '),(74,'kind',0,1,' json '),(74,'slug',0,1,''),(74,'title',0,1,' sv se '),(75,'extension',0,1,' json '),(75,'filename',0,1,' tr tr json '),(75,'kind',0,1,' json '),(75,'slug',0,1,''),(75,'title',0,1,' tr tr '),(76,'extension',0,1,' json '),(76,'filename',0,1,' fi fi json '),(76,'kind',0,1,' json '),(76,'slug',0,1,''),(76,'title',0,1,' fi fi '),(77,'extension',0,1,' json '),(77,'filename',0,1,' zh cn json '),(77,'kind',0,1,' json '),(77,'slug',0,1,''),(77,'title',0,1,' zh cn '),(78,'extension',0,1,' json '),(78,'filename',0,1,' ja jp json '),(78,'kind',0,1,' json '),(78,'slug',0,1,''),(78,'title',0,1,' ja jp '),(79,'extension',0,1,' json '),(79,'filename',0,1,' fa ir json '),(79,'kind',0,1,' json '),(79,'slug',0,1,''),(79,'title',0,1,' fa ir '),(80,'extension',0,1,' json '),(80,'filename',0,1,' es es json '),(80,'kind',0,1,' json '),(80,'slug',0,1,''),(80,'title',0,1,' es es '),(81,'extension',0,1,' json '),(81,'filename',0,1,' fr fr json '),(81,'kind',0,1,' json '),(81,'slug',0,1,''),(81,'title',0,1,' fr fr '),(82,'extension',0,1,' json '),(82,'filename',0,1,' he il json '),(82,'kind',0,1,' json '),(82,'slug',0,1,''),(82,'title',0,1,' he il '),(83,'extension',0,1,' json '),(83,'filename',0,1,' ar eg json '),(83,'kind',0,1,' json '),(83,'slug',0,1,''),(83,'title',0,1,' ar eg '),(84,'extension',0,1,' json '),(84,'filename',0,1,' mk mk json '),(84,'kind',0,1,' json '),(84,'slug',0,1,''),(84,'title',0,1,' mk mk '),(85,'extension',0,1,' json '),(85,'filename',0,1,' cs cz json '),(85,'kind',0,1,' json '),(85,'slug',0,1,''),(85,'title',0,1,' cs cz '),(86,'extension',0,1,' json '),(86,'filename',0,1,' de de json '),(86,'kind',0,1,' json '),(86,'slug',0,1,''),(86,'title',0,1,' de de '),(87,'extension',0,1,' json '),(87,'filename',0,1,' fr ca json '),(87,'kind',0,1,' json '),(87,'slug',0,1,''),(87,'title',0,1,' fr ca '),(88,'extension',0,1,' json '),(88,'filename',0,1,' ko kr json '),(88,'kind',0,1,' json '),(88,'slug',0,1,''),(88,'title',0,1,' ko kr '),(89,'extension',0,1,' json '),(89,'filename',0,1,' de ch json '),(89,'kind',0,1,' json '),(89,'slug',0,1,''),(89,'title',0,1,' de ch '),(90,'extension',0,1,' json '),(90,'filename',0,1,' da dk json '),(90,'kind',0,1,' json '),(90,'slug',0,1,''),(90,'title',0,1,' da dk '),(91,'extension',0,1,' json '),(91,'filename',0,1,' it it json '),(91,'kind',0,1,' json '),(91,'slug',0,1,''),(91,'title',0,1,' it it '),(92,'extension',0,1,' json '),(92,'filename',0,1,' zh tw json '),(92,'kind',0,1,' json '),(92,'slug',0,1,''),(92,'title',0,1,' zh tw '),(93,'extension',0,1,' json '),(93,'filename',0,1,' nb no json '),(93,'kind',0,1,' json '),(93,'slug',0,1,''),(93,'title',0,1,' nb no '),(94,'extension',0,1,' json '),(94,'filename',0,1,' ca es json '),(94,'kind',0,1,' json '),(94,'slug',0,1,''),(94,'title',0,1,' ca es '),(95,'extension',0,1,' js '),(95,'filename',0,1,' d3 js '),(95,'kind',0,1,' javascript '),(95,'slug',0,1,''),(95,'title',0,1,' d3 '),(96,'extension',0,1,' js '),(96,'filename',0,1,' assetindexer js '),(96,'kind',0,1,' javascript '),(96,'slug',0,1,''),(96,'title',0,1,' asset indexer '),(97,'extension',0,1,' js '),(97,'filename',0,1,' jquery ui js '),(97,'kind',0,1,' javascript '),(97,'slug',0,1,''),(97,'title',0,1,' jquery ui '),(98,'extension',0,1,' txt '),(98,'filename',0,1,' jquery ui js license txt '),(98,'kind',0,1,' text '),(98,'slug',0,1,''),(98,'title',0,1,' jquery ui js license '),(99,'extension',0,1,' js '),(99,'filename',0,1,' tailwind reset js '),(99,'kind',0,1,' javascript '),(99,'slug',0,1,''),(99,'title',0,1,' tailwind reset '),(100,'extension',0,1,' js '),(100,'filename',0,1,' element resize detector js '),(100,'kind',0,1,' javascript '),(100,'slug',0,1,''),(100,'title',0,1,' element resize detector '),(101,'extension',0,1,' txt '),(101,'filename',0,1,' element resize detector js license txt '),(101,'kind',0,1,' text '),(101,'slug',0,1,''),(101,'title',0,1,' element resize detector js license '),(102,'extension',0,1,' js '),(102,'filename',0,1,' jquery fileupload js '),(102,'kind',0,1,' javascript '),(102,'slug',0,1,''),(102,'title',0,1,' jquery fileupload '),(103,'extension',0,1,' js '),(103,'filename',0,1,' garnish js '),(103,'kind',0,1,' javascript '),(103,'slug',0,1,''),(103,'title',0,1,' garnish '),(104,'extension',0,1,' txt '),(104,'filename',0,1,' garnish js license txt '),(104,'kind',0,1,' text '),(104,'slug',0,1,''),(104,'title',0,1,' garnish js license '),(105,'extension',0,1,' txt '),(105,'filename',0,1,' picturefill js license txt '),(105,'kind',0,1,' text '),(105,'slug',0,1,''),(105,'title',0,1,' picturefill js license '),(106,'extension',0,1,' js '),(106,'filename',0,1,' picturefill js '),(106,'kind',0,1,' javascript '),(106,'slug',0,1,''),(106,'title',0,1,' picturefill '),(107,'extension',0,1,' js '),(107,'filename',0,1,' selectize js '),(107,'kind',0,1,' javascript '),(107,'slug',0,1,''),(107,'title',0,1,' selectize '),(108,'extension',0,1,' js '),(108,'filename',0,1,' jquery payment js '),(108,'kind',0,1,' javascript '),(108,'slug',0,1,''),(108,'title',0,1,' jquery payment '),(109,'extension',0,1,' js '),(109,'filename',0,1,' login js '),(109,'kind',0,1,' javascript '),(109,'slug',0,1,''),(109,'title',0,1,' login '),(110,'extension',0,1,' js '),(110,'filename',0,1,' conditionbuilder js '),(110,'kind',0,1,' javascript '),(110,'slug',0,1,''),(110,'title',0,1,' condition builder '),(111,'extension',0,1,' js '),(111,'filename',0,1,' velocity js '),(111,'kind',0,1,' javascript '),(111,'slug',0,1,''),(111,'title',0,1,' velocity '),(112,'extension',0,1,' txt '),(112,'filename',0,1,' velocity js license txt '),(112,'kind',0,1,' text '),(112,'slug',0,1,''),(112,'title',0,1,' velocity js license '),(113,'extension',0,1,' js '),(113,'filename',0,1,' recententrieswidget js '),(113,'kind',0,1,' javascript '),(113,'slug',0,1,''),(113,'title',0,1,' recent entries widget '),(114,'extension',0,1,' js '),(114,'filename',0,1,' fabric js '),(114,'kind',0,1,' javascript '),(114,'slug',0,1,''),(114,'title',0,1,' fabric '),(115,'extension',0,1,' txt '),(115,'filename',0,1,' fabric js license txt '),(115,'kind',0,1,' text '),(115,'slug',0,1,''),(115,'title',0,1,' fabric js license '),(116,'extension',0,1,' json '),(116,'filename',0,1,' manifest json '),(116,'kind',0,1,' json '),(116,'slug',0,1,''),(116,'title',0,1,' manifest '),(117,'extension',0,1,' js '),(117,'filename',0,1,' app js '),(117,'kind',0,1,' javascript '),(117,'slug',0,1,''),(117,'title',0,1,' app '),(118,'extension',0,1,' txt '),(118,'filename',0,1,' app js license txt '),(118,'kind',0,1,' text '),(118,'slug',0,1,''),(118,'title',0,1,' app js license '),(119,'extension',0,1,' png '),(119,'filename',0,1,' resizehandle rtl 2x png '),(119,'kind',0,1,' image '),(119,'slug',0,1,''),(119,'title',0,1,' resizehandle rtl 2x '),(120,'extension',0,1,' png '),(120,'filename',0,1,' resizehandle rtl png '),(120,'kind',0,1,' image '),(120,'slug',0,1,''),(120,'title',0,1,' resizehandle rtl '),(121,'extension',0,1,' svg '),(121,'filename',0,1,' chrome tablet bottom svg '),(121,'kind',0,1,' image '),(121,'slug',0,1,''),(121,'title',0,1,' chrome tablet bottom '),(122,'extension',0,1,' svg '),(122,'filename',0,1,' icon phone svg '),(122,'kind',0,1,' image '),(122,'slug',0,1,''),(122,'title',0,1,' icon phone '),(123,'extension',0,1,' svg '),(123,'filename',0,1,' icon desktop svg '),(123,'kind',0,1,' image '),(123,'slug',0,1,''),(123,'title',0,1,' icon desktop '),(124,'extension',0,1,' svg '),(124,'filename',0,1,' chrome phone bottom svg '),(124,'kind',0,1,' image '),(124,'slug',0,1,''),(124,'title',0,1,' chrome phone bottom '),(125,'extension',0,1,' svg '),(125,'filename',0,1,' icon tablet svg '),(125,'kind',0,1,' image '),(125,'slug',0,1,''),(125,'title',0,1,' icon tablet '),(126,'extension',0,1,' svg '),(126,'filename',0,1,' chrome tablet top svg '),(126,'kind',0,1,' image '),(126,'slug',0,1,''),(126,'title',0,1,' chrome tablet top '),(127,'extension',0,1,' svg '),(127,'filename',0,1,' chrome phone top svg '),(127,'kind',0,1,' image '),(127,'slug',0,1,''),(127,'title',0,1,' chrome phone top '),(128,'extension',0,1,' png '),(128,'filename',0,1,' hudtip right png '),(128,'kind',0,1,' image '),(128,'slug',0,1,''),(128,'title',0,1,' hudtip right '),(129,'extension',0,1,' svg '),(129,'filename',0,1,' user svg '),(129,'kind',0,1,' image '),(129,'slug',0,1,''),(129,'title',0,1,' user '),(130,'extension',0,1,' png '),(130,'filename',0,1,' welcome logo 2x png '),(130,'kind',0,1,' image '),(130,'slug',0,1,''),(130,'title',0,1,' welcome logo 2x '),(131,'extension',0,1,' png '),(131,'filename',0,1,' temp folder png '),(131,'kind',0,1,' image '),(131,'slug',0,1,''),(131,'title',0,1,' temp folder '),(132,'extension',0,1,' png '),(132,'filename',0,1,' craft png '),(132,'kind',0,1,' image '),(132,'slug',0,1,''),(132,'title',0,1,' craft '),(133,'extension',0,1,' png '),(133,'filename',0,1,' hudtip bottom png '),(133,'kind',0,1,' image '),(133,'slug',0,1,''),(133,'title',0,1,' hudtip bottom '),(134,'extension',0,1,' png '),(134,'filename',0,1,' hudtip bottom gray 2x png '),(134,'kind',0,1,' image '),(134,'slug',0,1,''),(134,'title',0,1,' hudtip bottom gray 2x '),(135,'extension',0,1,' png '),(135,'filename',0,1,' listview sort 2x png '),(135,'kind',0,1,' image '),(135,'slug',0,1,''),(135,'title',0,1,' listview sort 2x '),(136,'extension',0,1,' png '),(136,'filename',0,1,' welcome logo png '),(136,'kind',0,1,' image '),(136,'slug',0,1,''),(136,'title',0,1,' welcome logo '),(137,'extension',0,1,' png '),(137,'filename',0,1,' resizehandle 2x png '),(137,'kind',0,1,' image '),(137,'slug',0,1,''),(137,'title',0,1,' resizehandle 2x '),(138,'extension',0,1,' png '),(138,'filename',0,1,' hudtip top 2x png '),(138,'kind',0,1,' image '),(138,'slug',0,1,''),(138,'title',0,1,' hudtip top 2x '),(139,'extension',0,1,' png '),(139,'filename',0,1,' hudtip top png '),(139,'kind',0,1,' image '),(139,'slug',0,1,''),(139,'title',0,1,' hudtip top '),(140,'extension',0,1,' png '),(140,'filename',0,1,' resizehandle png '),(140,'kind',0,1,' image '),(140,'slug',0,1,''),(140,'title',0,1,' resizehandle '),(141,'extension',0,1,' svg '),(141,'filename',0,1,' safari pinned tab svg '),(141,'kind',0,1,' image '),(141,'slug',0,1,''),(141,'title',0,1,' safari pinned tab '),(142,'extension',0,1,' svg '),(142,'filename',0,1,' icon svg '),(142,'kind',0,1,' image '),(142,'slug',0,1,''),(142,'title',0,1,' icon '),(143,'extension',0,1,' png '),(143,'filename',0,1,' apple touch icon png '),(143,'kind',0,1,' image '),(143,'slug',0,1,''),(143,'title',0,1,' apple touch icon '),(144,'extension',0,1,' png '),(144,'filename',0,1,' success png '),(144,'kind',0,1,' image '),(144,'slug',0,1,''),(144,'title',0,1,' success '),(145,'extension',0,1,' svg '),(145,'filename',0,1,' filters svg '),(145,'kind',0,1,' image '),(145,'slug',0,1,''),(145,'title',0,1,' filters '),(146,'extension',0,1,' svg '),(146,'filename',0,1,' orientation landscape unchecked svg '),(146,'kind',0,1,' image '),(146,'slug',0,1,''),(146,'title',0,1,' orientation landscape unchecked '),(147,'extension',0,1,' svg '),(147,'filename',0,1,' flip horizontal svg '),(147,'kind',0,1,' image '),(147,'slug',0,1,''),(147,'title',0,1,' flip horizontal '),(148,'extension',0,1,' svg '),(148,'filename',0,1,' check svg '),(148,'kind',0,1,' image '),(148,'slug',0,1,''),(148,'title',0,1,' check '),(149,'extension',0,1,' svg '),(149,'filename',0,1,' flip vertical svg '),(149,'kind',0,1,' image '),(149,'slug',0,1,''),(149,'title',0,1,' flip vertical '),(150,'extension',0,1,' svg '),(150,'filename',0,1,' orientation landscape checked svg '),(150,'kind',0,1,' image '),(150,'slug',0,1,''),(150,'title',0,1,' orientation landscape checked '),(151,'extension',0,1,' svg '),(151,'filename',0,1,' focal point svg '),(151,'kind',0,1,' image '),(151,'slug',0,1,''),(151,'title',0,1,' focal point '),(152,'extension',0,1,' svg '),(152,'filename',0,1,' crop svg '),(152,'kind',0,1,' image '),(152,'slug',0,1,''),(152,'title',0,1,' crop '),(153,'extension',0,1,' svg '),(153,'filename',0,1,' unconstrained svg '),(153,'kind',0,1,' image '),(153,'slug',0,1,''),(153,'title',0,1,' unconstrained '),(154,'extension',0,1,' svg '),(154,'filename',0,1,' rotate left svg '),(154,'kind',0,1,' image '),(154,'slug',0,1,''),(154,'title',0,1,' rotate left '),(155,'extension',0,1,' svg '),(155,'filename',0,1,' orientation portrait unchecked svg '),(155,'kind',0,1,' image '),(155,'slug',0,1,''),(155,'title',0,1,' orientation portrait unchecked '),(156,'extension',0,1,' svg '),(156,'filename',0,1,' rotate right svg '),(156,'kind',0,1,' image '),(156,'slug',0,1,''),(156,'title',0,1,' rotate right '),(157,'extension',0,1,' svg '),(157,'filename',0,1,' orientation portrait checked svg '),(157,'kind',0,1,' image '),(157,'slug',0,1,''),(157,'title',0,1,' orientation portrait checked '),(158,'extension',0,1,' jpg '),(158,'filename',0,1,' prg jpg '),(158,'kind',0,1,' image '),(158,'slug',0,1,''),(158,'title',0,1,' prg '),(159,'extension',0,1,' png '),(159,'filename',0,1,' hudtip left png '),(159,'kind',0,1,' image '),(159,'slug',0,1,''),(159,'title',0,1,' hudtip left '),(160,'extension',0,1,' png '),(160,'filename',0,1,' success 2x png '),(160,'kind',0,1,' image '),(160,'slug',0,1,''),(160,'title',0,1,' success 2x '),(161,'extension',0,1,' png '),(161,'filename',0,1,' hudtip bottom 2x png '),(161,'kind',0,1,' image '),(161,'slug',0,1,''),(161,'title',0,1,' hudtip bottom 2x '),(162,'extension',0,1,' svg '),(162,'filename',0,1,' craftcms svg '),(162,'kind',0,1,' image '),(162,'slug',0,1,''),(162,'title',0,1,' craftcms '),(163,'extension',0,1,' png '),(163,'filename',0,1,' hudtip left 2x png '),(163,'kind',0,1,' image '),(163,'slug',0,1,''),(163,'title',0,1,' hudtip left 2x '),(164,'extension',0,1,' svg '),(164,'filename',0,1,' dev mode svg '),(164,'kind',0,1,' image '),(164,'slug',0,1,''),(164,'title',0,1,' dev mode '),(165,'extension',0,1,' png '),(165,'filename',0,1,' branch rtl png '),(165,'kind',0,1,' image '),(165,'slug',0,1,''),(165,'title',0,1,' branch rtl '),(166,'extension',0,1,' png '),(166,'filename',0,1,' craft 2x png '),(166,'kind',0,1,' image '),(166,'slug',0,1,''),(166,'title',0,1,' craft 2x '),(167,'extension',0,1,' png '),(167,'filename',0,1,' listview sort png '),(167,'kind',0,1,' image '),(167,'slug',0,1,''),(167,'title',0,1,' listview sort '),(168,'extension',0,1,' png '),(168,'filename',0,1,' branch rtl 2x png '),(168,'kind',0,1,' image '),(168,'slug',0,1,''),(168,'title',0,1,' branch rtl 2x '),(169,'extension',0,1,' png '),(169,'filename',0,1,' hudtip right 2x png '),(169,'kind',0,1,' image '),(169,'slug',0,1,''),(169,'title',0,1,' hudtip right 2x '),(170,'extension',0,1,' png '),(170,'filename',0,1,' branch png '),(170,'kind',0,1,' image '),(170,'slug',0,1,''),(170,'title',0,1,' branch '),(171,'extension',0,1,' png '),(171,'filename',0,1,' hudtip bottom gray png '),(171,'kind',0,1,' image '),(171,'slug',0,1,''),(171,'title',0,1,' hudtip bottom gray '),(172,'extension',0,1,' png '),(172,'filename',0,1,' branch 2x png '),(172,'kind',0,1,' image '),(172,'slug',0,1,''),(172,'title',0,1,' branch 2x '),(173,'extension',0,1,' js '),(173,'filename',0,1,' cp js '),(173,'kind',0,1,' javascript '),(173,'slug',0,1,''),(173,'title',0,1,' cp '),(174,'extension',0,1,' svg '),(174,'filename',0,1,' craft svg '),(174,'kind',0,1,' image '),(174,'slug',0,1,''),(174,'title',0,1,' craft '),(175,'extension',0,1,' js '),(175,'filename',0,1,' feedwidget js '),(175,'kind',0,1,' javascript '),(175,'slug',0,1,''),(175,'title',0,1,' feed widget '),(176,'extension',0,1,' js '),(176,'filename',0,1,' updateswidget js '),(176,'kind',0,1,' javascript '),(176,'slug',0,1,''),(176,'title',0,1,' updates widget '),(177,'extension',0,1,' txt '),(177,'filename',0,1,' axios js license txt '),(177,'kind',0,1,' text '),(177,'slug',0,1,''),(177,'title',0,1,' axios js license '),(178,'extension',0,1,' js '),(178,'filename',0,1,' axios js '),(178,'kind',0,1,' javascript '),(178,'slug',0,1,''),(178,'title',0,1,' axios '),(179,'extension',0,1,' js '),(179,'filename',0,1,' jquery mobile events js '),(179,'kind',0,1,' javascript '),(179,'slug',0,1,''),(179,'title',0,1,' jquery mobile events '),(180,'extension',0,1,' txt '),(180,'filename',0,1,' jquery mobile events js license txt '),(180,'kind',0,1,' text '),(180,'slug',0,1,''),(180,'title',0,1,' jquery mobile events js license '),(181,'extension',0,1,' js '),(181,'filename',0,1,' iframeresizer contentwindow js '),(181,'kind',0,1,' javascript '),(181,'slug',0,1,''),(181,'title',0,1,' iframe resizer content window '),(182,'extension',0,1,' js '),(182,'filename',0,1,' iframeresizer js '),(182,'kind',0,1,' javascript '),(182,'slug',0,1,''),(182,'title',0,1,' iframe resizer '),(183,'extension',0,1,' png '),(183,'filename',0,1,' db png '),(183,'kind',0,1,' image '),(183,'slug',0,1,''),(183,'title',0,1,' db '),(184,'extension',0,1,' png '),(184,'filename',0,1,' account png '),(184,'kind',0,1,' image '),(184,'slug',0,1,''),(184,'title',0,1,' account '),(185,'extension',0,1,' png '),(185,'filename',0,1,' site png '),(185,'kind',0,1,' image '),(185,'slug',0,1,''),(185,'title',0,1,' site '),(186,'extension',0,1,' png '),(186,'filename',0,1,' installer bg png '),(186,'kind',0,1,' image '),(186,'slug',0,1,''),(186,'title',0,1,' installer bg '),(187,'extension',0,1,' js '),(187,'filename',0,1,' install js '),(187,'kind',0,1,' javascript '),(187,'slug',0,1,''),(187,'title',0,1,' install '),(188,'extension',0,1,' js '),(188,'filename',0,1,' prism js '),(188,'kind',0,1,' javascript '),(188,'slug',0,1,''),(188,'title',0,1,' prism '),(189,'extension',0,1,' txt '),(189,'filename',0,1,' jquery js license txt '),(189,'kind',0,1,' text '),(189,'slug',0,1,''),(189,'title',0,1,' jquery js license '),(190,'extension',0,1,' js '),(190,'filename',0,1,' jquery js '),(190,'kind',0,1,' javascript '),(190,'slug',0,1,''),(190,'title',0,1,' jquery '),(191,'extension',0,1,' js '),(191,'filename',0,1,' vue js '),(191,'kind',0,1,' javascript '),(191,'slug',0,1,''),(191,'title',0,1,' vue '),(192,'extension',0,1,' txt '),(192,'filename',0,1,' vue js license txt '),(192,'kind',0,1,' text '),(192,'slug',0,1,''),(192,'title',0,1,' vue js license '),(193,'extension',0,1,' json '),(193,'filename',0,1,' manifest json '),(193,'kind',0,1,' json '),(193,'slug',0,1,''),(193,'title',0,1,' manifest '),(194,'extension',0,1,' js '),(194,'filename',0,1,' queue manager js '),(194,'kind',0,1,' javascript '),(194,'slug',0,1,''),(194,'title',0,1,' queue manager '),(195,'extension',0,1,' txt '),(195,'filename',0,1,' queue manager js license txt '),(195,'kind',0,1,' text '),(195,'slug',0,1,''),(195,'title',0,1,' queue manager js license '),(196,'extension',0,1,' js '),(196,'filename',0,1,' utilities js '),(196,'kind',0,1,' javascript '),(196,'slug',0,1,''),(196,'title',0,1,' utilities '),(197,'extension',0,1,' js '),(197,'filename',0,1,' craftsupportwidget js '),(197,'kind',0,1,' javascript '),(197,'slug',0,1,''),(197,'title',0,1,' craft support widget '),(198,'extension',0,1,' svg '),(198,'filename',0,1,' craft partners svg '),(198,'kind',0,1,' image '),(198,'slug',0,1,''),(198,'title',0,1,' craft partners '),(199,'extension',0,1,' svg '),(199,'filename',0,1,' craftquest svg '),(199,'kind',0,1,' image '),(199,'slug',0,1,''),(199,'title',0,1,' craftquest '),(200,'extension',0,1,' svg '),(200,'filename',0,1,' discord svg '),(200,'kind',0,1,' image '),(200,'slug',0,1,''),(200,'title',0,1,' discord '),(201,'extension',0,1,' jpeg '),(201,'filename',0,1,' do research jpeg '),(201,'kind',0,1,' image '),(201,'slug',0,1,''),(201,'title',0,1,' do research '),(202,'extension',0,1,' js '),(202,'filename',0,1,' dashboard js '),(202,'kind',0,1,' javascript '),(202,'slug',0,1,''),(202,'title',0,1,' dashboard '),(203,'extension',0,1,' txt '),(203,'filename',0,1,' xregexp all js license txt '),(203,'kind',0,1,' text '),(203,'slug',0,1,''),(203,'title',0,1,' xregexp all js license '),(204,'extension',0,1,' js '),(204,'filename',0,1,' xregexp all js '),(204,'kind',0,1,' javascript '),(204,'slug',0,1,''),(204,'title',0,1,' xregexp all '),(205,'extension',0,1,' js '),(205,'filename',0,1,' htmx min js '),(205,'kind',0,1,' javascript '),(205,'slug',0,1,''),(205,'title',0,1,' htmx min '),(206,'extension',0,1,' json '),(206,'filename',0,1,' ar om json '),(206,'kind',0,1,' json '),(206,'slug',0,1,''),(206,'title',0,1,' ar om '),(207,'extension',0,1,' json '),(207,'filename',0,1,' uk ua json '),(207,'kind',0,1,' json '),(207,'slug',0,1,''),(207,'title',0,1,' uk ua '),(208,'extension',0,1,' json '),(208,'filename',0,1,' ar qa json '),(208,'kind',0,1,' json '),(208,'slug',0,1,''),(208,'title',0,1,' ar qa '),(209,'extension',0,1,' json '),(209,'filename',0,1,' es bo json '),(209,'kind',0,1,' json '),(209,'slug',0,1,''),(209,'title',0,1,' es bo '),(210,'extension',0,1,' json '),(210,'filename',0,1,' en us json '),(210,'kind',0,1,' json '),(210,'slug',0,1,''),(210,'title',0,1,' en us '),(211,'extension',0,1,' json '),(211,'filename',0,1,' ru ru json '),(211,'kind',0,1,' json '),(211,'slug',0,1,''),(211,'title',0,1,' ru ru '),(212,'extension',0,1,' json '),(212,'filename',0,1,' ar ye json '),(212,'kind',0,1,' json '),(212,'slug',0,1,''),(212,'title',0,1,' ar ye '),(213,'extension',0,1,' json '),(213,'filename',0,1,' ar ps json '),(213,'kind',0,1,' json '),(213,'slug',0,1,''),(213,'title',0,1,' ar ps '),(214,'extension',0,1,' json '),(214,'filename',0,1,' pt br json '),(214,'kind',0,1,' json '),(214,'slug',0,1,''),(214,'title',0,1,' pt br '),(215,'extension',0,1,' json '),(215,'filename',0,1,' ar kw json '),(215,'kind',0,1,' json '),(215,'slug',0,1,''),(215,'title',0,1,' ar kw '),(216,'extension',0,1,' json '),(216,'filename',0,1,' pl pl json '),(216,'kind',0,1,' json '),(216,'slug',0,1,''),(216,'title',0,1,' pl pl '),(217,'extension',0,1,' json '),(217,'filename',0,1,' ar sd json '),(217,'kind',0,1,' json '),(217,'slug',0,1,''),(217,'title',0,1,' ar sd '),(218,'extension',0,1,' json '),(218,'filename',0,1,' ar 001 json '),(218,'kind',0,1,' json '),(218,'slug',0,1,''),(218,'title',0,1,' ar 001 '),(219,'extension',0,1,' json '),(219,'filename',0,1,' ar mr json '),(219,'kind',0,1,' json '),(219,'slug',0,1,''),(219,'title',0,1,' ar mr '),(220,'extension',0,1,' json '),(220,'filename',0,1,' hu hu json '),(220,'kind',0,1,' json '),(220,'slug',0,1,''),(220,'title',0,1,' hu hu '),(221,'extension',0,1,' json '),(221,'filename',0,1,' en gb json '),(221,'kind',0,1,' json '),(221,'slug',0,1,''),(221,'title',0,1,' en gb '),(222,'extension',0,1,' json '),(222,'filename',0,1,' en ca json '),(222,'kind',0,1,' json '),(222,'slug',0,1,''),(222,'title',0,1,' en ca '),(223,'extension',0,1,' json '),(223,'filename',0,1,' ar er json '),(223,'kind',0,1,' json '),(223,'slug',0,1,''),(223,'title',0,1,' ar er '),(224,'extension',0,1,' json '),(224,'filename',0,1,' nl nl json '),(224,'kind',0,1,' json '),(224,'slug',0,1,''),(224,'title',0,1,' nl nl '),(225,'extension',0,1,' json '),(225,'filename',0,1,' es mx json '),(225,'kind',0,1,' json '),(225,'slug',0,1,''),(225,'title',0,1,' es mx '),(226,'extension',0,1,' json '),(226,'filename',0,1,' sv se json '),(226,'kind',0,1,' json '),(226,'slug',0,1,''),(226,'title',0,1,' sv se '),(227,'extension',0,1,' json '),(227,'filename',0,1,' ar lb json '),(227,'kind',0,1,' json '),(227,'slug',0,1,''),(227,'title',0,1,' ar lb '),(228,'extension',0,1,' json '),(228,'filename',0,1,' ar jo json '),(228,'kind',0,1,' json '),(228,'slug',0,1,''),(228,'title',0,1,' ar jo '),(229,'extension',0,1,' json '),(229,'filename',0,1,' fi fi json '),(229,'kind',0,1,' json '),(229,'slug',0,1,''),(229,'title',0,1,' fi fi '),(230,'extension',0,1,' json '),(230,'filename',0,1,' zh cn json '),(230,'kind',0,1,' json '),(230,'slug',0,1,''),(230,'title',0,1,' zh cn '),(231,'extension',0,1,' json '),(231,'filename',0,1,' ja jp json '),(231,'kind',0,1,' json '),(231,'slug',0,1,''),(231,'title',0,1,' ja jp '),(232,'extension',0,1,' json '),(232,'filename',0,1,' ar so json '),(232,'kind',0,1,' json '),(232,'slug',0,1,''),(232,'title',0,1,' ar so '),(233,'extension',0,1,' json '),(233,'filename',0,1,' en in json '),(233,'kind',0,1,' json '),(233,'slug',0,1,''),(233,'title',0,1,' en in '),(234,'extension',0,1,' json '),(234,'filename',0,1,' es es json '),(234,'kind',0,1,' json '),(234,'slug',0,1,''),(234,'title',0,1,' es es '),(235,'extension',0,1,' json '),(235,'filename',0,1,' ar tn json '),(235,'kind',0,1,' json '),(235,'slug',0,1,''),(235,'title',0,1,' ar tn '),(236,'extension',0,1,' json '),(236,'filename',0,1,' fr fr json '),(236,'kind',0,1,' json '),(236,'slug',0,1,''),(236,'title',0,1,' fr fr '),(237,'extension',0,1,' json '),(237,'filename',0,1,' he il json '),(237,'kind',0,1,' json '),(237,'slug',0,1,''),(237,'title',0,1,' he il '),(238,'extension',0,1,' json '),(238,'filename',0,1,' ar eg json '),(238,'kind',0,1,' json '),(238,'slug',0,1,''),(238,'title',0,1,' ar eg '),(239,'extension',0,1,' json '),(239,'filename',0,1,' en ie json '),(239,'kind',0,1,' json '),(239,'slug',0,1,''),(239,'title',0,1,' en ie '),(240,'extension',0,1,' json '),(240,'filename',0,1,' mk mk json '),(240,'kind',0,1,' json '),(240,'slug',0,1,''),(240,'title',0,1,' mk mk '),(241,'extension',0,1,' json '),(241,'filename',0,1,' ar ly json '),(241,'kind',0,1,' json '),(241,'slug',0,1,''),(241,'title',0,1,' ar ly '),(242,'extension',0,1,' json '),(242,'filename',0,1,' ar iq json '),(242,'kind',0,1,' json '),(242,'slug',0,1,''),(242,'title',0,1,' ar iq '),(243,'extension',0,1,' json '),(243,'filename',0,1,' ar ma json '),(243,'kind',0,1,' json '),(243,'slug',0,1,''),(243,'title',0,1,' ar ma '),(244,'extension',0,1,' json '),(244,'filename',0,1,' cs cz json '),(244,'kind',0,1,' json '),(244,'slug',0,1,''),(244,'title',0,1,' cs cz '),(245,'extension',0,1,' json '),(245,'filename',0,1,' de de json '),(245,'kind',0,1,' json '),(245,'slug',0,1,''),(245,'title',0,1,' de de '),(246,'extension',0,1,' json '),(246,'filename',0,1,' ar sa json '),(246,'kind',0,1,' json '),(246,'slug',0,1,''),(246,'title',0,1,' ar sa '),(247,'extension',0,1,' json '),(247,'filename',0,1,' fr ca json '),(247,'kind',0,1,' json '),(247,'slug',0,1,''),(247,'title',0,1,' fr ca '),(248,'extension',0,1,' json '),(248,'filename',0,1,' ar dz json '),(248,'kind',0,1,' json '),(248,'slug',0,1,''),(248,'title',0,1,' ar dz '),(249,'extension',0,1,' json '),(249,'filename',0,1,' ar sy json '),(249,'kind',0,1,' json '),(249,'slug',0,1,''),(249,'title',0,1,' ar sy '),(250,'extension',0,1,' json '),(250,'filename',0,1,' ar eh json '),(250,'kind',0,1,' json '),(250,'slug',0,1,''),(250,'title',0,1,' ar eh '),(251,'extension',0,1,' json '),(251,'filename',0,1,' ko kr json '),(251,'kind',0,1,' json '),(251,'slug',0,1,''),(251,'title',0,1,' ko kr '),(252,'extension',0,1,' json '),(252,'filename',0,1,' de ch json '),(252,'kind',0,1,' json '),(252,'slug',0,1,''),(252,'title',0,1,' de ch '),(253,'extension',0,1,' json '),(253,'filename',0,1,' ar bh json '),(253,'kind',0,1,' json '),(253,'slug',0,1,''),(253,'title',0,1,' ar bh '),(254,'extension',0,1,' json '),(254,'filename',0,1,' it it json '),(254,'kind',0,1,' json '),(254,'slug',0,1,''),(254,'title',0,1,' it it '),(255,'extension',0,1,' json '),(255,'filename',0,1,' ar ss json '),(255,'kind',0,1,' json '),(255,'slug',0,1,''),(255,'title',0,1,' ar ss '),(256,'extension',0,1,' json '),(256,'filename',0,1,' ar dj json '),(256,'kind',0,1,' json '),(256,'slug',0,1,''),(256,'title',0,1,' ar dj '),(257,'extension',0,1,' json '),(257,'filename',0,1,' ar il json '),(257,'kind',0,1,' json '),(257,'slug',0,1,''),(257,'title',0,1,' ar il '),(258,'extension',0,1,' json '),(258,'filename',0,1,' ar ae json '),(258,'kind',0,1,' json '),(258,'slug',0,1,''),(258,'title',0,1,' ar ae '),(259,'extension',0,1,' json '),(259,'filename',0,1,' ar td json '),(259,'kind',0,1,' json '),(259,'slug',0,1,''),(259,'title',0,1,' ar td '),(260,'extension',0,1,' json '),(260,'filename',0,1,' ar km json '),(260,'kind',0,1,' json '),(260,'slug',0,1,''),(260,'title',0,1,' ar km '),(261,'extension',0,1,' json '),(261,'filename',0,1,' ca es json '),(261,'kind',0,1,' json '),(261,'slug',0,1,''),(261,'title',0,1,' ca es '),(262,'extension',0,1,' json '),(262,'filename',0,1,' uk ua json '),(262,'kind',0,1,' json '),(262,'slug',0,1,''),(262,'title',0,1,' uk ua '),(263,'extension',0,1,' json '),(263,'filename',0,1,' en us json '),(263,'kind',0,1,' json '),(263,'slug',0,1,''),(263,'title',0,1,' en us '),(264,'extension',0,1,' json '),(264,'filename',0,1,' ru ru json '),(264,'kind',0,1,' json '),(264,'slug',0,1,''),(264,'title',0,1,' ru ru '),(265,'extension',0,1,' json '),(265,'filename',0,1,' pt br json '),(265,'kind',0,1,' json '),(265,'slug',0,1,''),(265,'title',0,1,' pt br '),(266,'extension',0,1,' json '),(266,'filename',0,1,' pl pl json '),(266,'kind',0,1,' json '),(266,'slug',0,1,''),(266,'title',0,1,' pl pl '),(267,'extension',0,1,' json '),(267,'filename',0,1,' hu hu json '),(267,'kind',0,1,' json '),(267,'slug',0,1,''),(267,'title',0,1,' hu hu '),(268,'extension',0,1,' json '),(268,'filename',0,1,' en gb json '),(268,'kind',0,1,' json '),(268,'slug',0,1,''),(268,'title',0,1,' en gb '),(269,'extension',0,1,' json '),(269,'filename',0,1,' en ca json '),(269,'kind',0,1,' json '),(269,'slug',0,1,''),(269,'title',0,1,' en ca '),(270,'extension',0,1,' json '),(270,'filename',0,1,' nl nl json '),(270,'kind',0,1,' json '),(270,'slug',0,1,''),(270,'title',0,1,' nl nl '),(271,'extension',0,1,' json '),(271,'filename',0,1,' es mx json '),(271,'kind',0,1,' json '),(271,'slug',0,1,''),(271,'title',0,1,' es mx '),(272,'extension',0,1,' json '),(272,'filename',0,1,' sv se json '),(272,'kind',0,1,' json '),(272,'slug',0,1,''),(272,'title',0,1,' sv se '),(273,'extension',0,1,' json '),(273,'filename',0,1,' tr tr json '),(273,'kind',0,1,' json '),(273,'slug',0,1,''),(273,'title',0,1,' tr tr '),(274,'extension',0,1,' json '),(274,'filename',0,1,' fi fi json '),(274,'kind',0,1,' json '),(274,'slug',0,1,''),(274,'title',0,1,' fi fi '),(275,'extension',0,1,' json '),(275,'filename',0,1,' zh cn json '),(275,'kind',0,1,' json '),(275,'slug',0,1,''),(275,'title',0,1,' zh cn '),(276,'extension',0,1,' json '),(276,'filename',0,1,' ja jp json '),(276,'kind',0,1,' json '),(276,'slug',0,1,''),(276,'title',0,1,' ja jp '),(277,'extension',0,1,' json '),(277,'filename',0,1,' fa ir json '),(277,'kind',0,1,' json '),(277,'slug',0,1,''),(277,'title',0,1,' fa ir '),(278,'extension',0,1,' json '),(278,'filename',0,1,' es es json '),(278,'kind',0,1,' json '),(278,'slug',0,1,''),(278,'title',0,1,' es es '),(279,'extension',0,1,' json '),(279,'filename',0,1,' fr fr json '),(279,'kind',0,1,' json '),(279,'slug',0,1,''),(279,'title',0,1,' fr fr '),(280,'extension',0,1,' json '),(280,'filename',0,1,' he il json '),(280,'kind',0,1,' json '),(280,'slug',0,1,''),(280,'title',0,1,' he il '),(281,'extension',0,1,' json '),(281,'filename',0,1,' ar eg json '),(281,'kind',0,1,' json '),(281,'slug',0,1,''),(281,'title',0,1,' ar eg '),(282,'extension',0,1,' json '),(282,'filename',0,1,' mk mk json '),(282,'kind',0,1,' json '),(282,'slug',0,1,''),(282,'title',0,1,' mk mk '),(283,'extension',0,1,' json '),(283,'filename',0,1,' cs cz json '),(283,'kind',0,1,' json '),(283,'slug',0,1,''),(283,'title',0,1,' cs cz '),(284,'extension',0,1,' json '),(284,'filename',0,1,' de de json '),(284,'kind',0,1,' json '),(284,'slug',0,1,''),(284,'title',0,1,' de de '),(285,'extension',0,1,' json '),(285,'filename',0,1,' fr ca json '),(285,'kind',0,1,' json '),(285,'slug',0,1,''),(285,'title',0,1,' fr ca '),(286,'extension',0,1,' json '),(286,'filename',0,1,' ko kr json '),(286,'kind',0,1,' json '),(286,'slug',0,1,''),(286,'title',0,1,' ko kr '),(287,'extension',0,1,' json '),(287,'filename',0,1,' de ch json '),(287,'kind',0,1,' json '),(287,'slug',0,1,''),(287,'title',0,1,' de ch '),(288,'extension',0,1,' json '),(288,'filename',0,1,' da dk json '),(288,'kind',0,1,' json '),(288,'slug',0,1,''),(288,'title',0,1,' da dk '),(289,'extension',0,1,' json '),(289,'filename',0,1,' it it json '),(289,'kind',0,1,' json '),(289,'slug',0,1,''),(289,'title',0,1,' it it '),(290,'extension',0,1,' json '),(290,'filename',0,1,' zh tw json '),(290,'kind',0,1,' json '),(290,'slug',0,1,''),(290,'title',0,1,' zh tw '),(291,'extension',0,1,' json '),(291,'filename',0,1,' nb no json '),(291,'kind',0,1,' json '),(291,'slug',0,1,''),(291,'title',0,1,' nb no '),(292,'extension',0,1,' json '),(292,'filename',0,1,' ca es json '),(292,'kind',0,1,' json '),(292,'slug',0,1,''),(292,'title',0,1,' ca es '),(293,'extension',0,1,' js '),(293,'filename',0,1,' d3 js '),(293,'kind',0,1,' javascript '),(293,'slug',0,1,''),(293,'title',0,1,' d3 '),(294,'extension',0,1,' js '),(294,'filename',0,1,' assetindexer js '),(294,'kind',0,1,' javascript '),(294,'slug',0,1,''),(294,'title',0,1,' asset indexer '),(295,'extension',0,1,' js '),(295,'filename',0,1,' jquery ui js '),(295,'kind',0,1,' javascript '),(295,'slug',0,1,''),(295,'title',0,1,' jquery ui '),(296,'extension',0,1,' txt '),(296,'filename',0,1,' jquery ui js license txt '),(296,'kind',0,1,' text '),(296,'slug',0,1,''),(296,'title',0,1,' jquery ui js license '),(297,'extension',0,1,' js '),(297,'filename',0,1,' tailwind reset js '),(297,'kind',0,1,' javascript '),(297,'slug',0,1,''),(297,'title',0,1,' tailwind reset '),(298,'extension',0,1,' js '),(298,'filename',0,1,' element resize detector js '),(298,'kind',0,1,' javascript '),(298,'slug',0,1,''),(298,'title',0,1,' element resize detector '),(299,'extension',0,1,' txt '),(299,'filename',0,1,' element resize detector js license txt '),(299,'kind',0,1,' text '),(299,'slug',0,1,''),(299,'title',0,1,' element resize detector js license '),(300,'extension',0,1,' js '),(300,'filename',0,1,' jquery fileupload js '),(300,'kind',0,1,' javascript '),(300,'slug',0,1,''),(300,'title',0,1,' jquery fileupload '),(301,'extension',0,1,' js '),(301,'filename',0,1,' garnish js '),(301,'kind',0,1,' javascript '),(301,'slug',0,1,''),(301,'title',0,1,' garnish '),(302,'extension',0,1,' txt '),(302,'filename',0,1,' garnish js license txt '),(302,'kind',0,1,' text '),(302,'slug',0,1,''),(302,'title',0,1,' garnish js license '),(303,'extension',0,1,' txt '),(303,'filename',0,1,' picturefill js license txt '),(303,'kind',0,1,' text '),(303,'slug',0,1,''),(303,'title',0,1,' picturefill js license '),(304,'extension',0,1,' js '),(304,'filename',0,1,' picturefill js '),(304,'kind',0,1,' javascript '),(304,'slug',0,1,''),(304,'title',0,1,' picturefill '),(305,'extension',0,1,' js '),(305,'filename',0,1,' selectize js '),(305,'kind',0,1,' javascript '),(305,'slug',0,1,''),(305,'title',0,1,' selectize '),(306,'extension',0,1,' js '),(306,'filename',0,1,' jquery payment js '),(306,'kind',0,1,' javascript '),(306,'slug',0,1,''),(306,'title',0,1,' jquery payment '),(307,'extension',0,1,' js '),(307,'filename',0,1,' login js '),(307,'kind',0,1,' javascript '),(307,'slug',0,1,''),(307,'title',0,1,' login '),(308,'extension',0,1,' js '),(308,'filename',0,1,' conditionbuilder js '),(308,'kind',0,1,' javascript '),(308,'slug',0,1,''),(308,'title',0,1,' condition builder '),(309,'extension',0,1,' js '),(309,'filename',0,1,' velocity js '),(309,'kind',0,1,' javascript '),(309,'slug',0,1,''),(309,'title',0,1,' velocity '),(310,'extension',0,1,' txt '),(310,'filename',0,1,' velocity js license txt '),(310,'kind',0,1,' text '),(310,'slug',0,1,''),(310,'title',0,1,' velocity js license '),(311,'extension',0,1,' js '),(311,'filename',0,1,' recententrieswidget js '),(311,'kind',0,1,' javascript '),(311,'slug',0,1,''),(311,'title',0,1,' recent entries widget '),(312,'extension',0,1,' js '),(312,'filename',0,1,' fabric js '),(312,'kind',0,1,' javascript '),(312,'slug',0,1,''),(312,'title',0,1,' fabric '),(313,'extension',0,1,' txt '),(313,'filename',0,1,' fabric js license txt '),(313,'kind',0,1,' text '),(313,'slug',0,1,''),(313,'title',0,1,' fabric js license '),(314,'extension',0,1,' json '),(314,'filename',0,1,' manifest json '),(314,'kind',0,1,' json '),(314,'slug',0,1,''),(314,'title',0,1,' manifest '),(315,'extension',0,1,' js '),(315,'filename',0,1,' app js '),(315,'kind',0,1,' javascript '),(315,'slug',0,1,''),(315,'title',0,1,' app '),(316,'extension',0,1,' txt '),(316,'filename',0,1,' app js license txt '),(316,'kind',0,1,' text '),(316,'slug',0,1,''),(316,'title',0,1,' app js license '),(317,'extension',0,1,' png '),(317,'filename',0,1,' resizehandle rtl 2x png '),(317,'kind',0,1,' image '),(317,'slug',0,1,''),(317,'title',0,1,' resizehandle rtl 2x '),(318,'extension',0,1,' png '),(318,'filename',0,1,' resizehandle rtl png '),(318,'kind',0,1,' image '),(318,'slug',0,1,''),(318,'title',0,1,' resizehandle rtl '),(319,'extension',0,1,' svg '),(319,'filename',0,1,' chrome tablet bottom svg '),(319,'kind',0,1,' image '),(319,'slug',0,1,''),(319,'title',0,1,' chrome tablet bottom '),(320,'extension',0,1,' svg '),(320,'filename',0,1,' icon phone svg '),(320,'kind',0,1,' image '),(320,'slug',0,1,''),(320,'title',0,1,' icon phone '),(321,'extension',0,1,' svg '),(321,'filename',0,1,' icon desktop svg '),(321,'kind',0,1,' image '),(321,'slug',0,1,''),(321,'title',0,1,' icon desktop '),(322,'extension',0,1,' svg '),(322,'filename',0,1,' chrome phone bottom svg '),(322,'kind',0,1,' image '),(322,'slug',0,1,''),(322,'title',0,1,' chrome phone bottom '),(323,'extension',0,1,' svg '),(323,'filename',0,1,' icon tablet svg '),(323,'kind',0,1,' image '),(323,'slug',0,1,''),(323,'title',0,1,' icon tablet '),(324,'extension',0,1,' svg '),(324,'filename',0,1,' chrome tablet top svg '),(324,'kind',0,1,' image '),(324,'slug',0,1,''),(324,'title',0,1,' chrome tablet top '),(325,'extension',0,1,' svg '),(325,'filename',0,1,' chrome phone top svg '),(325,'kind',0,1,' image '),(325,'slug',0,1,''),(325,'title',0,1,' chrome phone top '),(326,'extension',0,1,' png '),(326,'filename',0,1,' hudtip right png '),(326,'kind',0,1,' image '),(326,'slug',0,1,''),(326,'title',0,1,' hudtip right '),(327,'extension',0,1,' svg '),(327,'filename',0,1,' user svg '),(327,'kind',0,1,' image '),(327,'slug',0,1,''),(327,'title',0,1,' user '),(328,'extension',0,1,' png '),(328,'filename',0,1,' welcome logo 2x png '),(328,'kind',0,1,' image '),(328,'slug',0,1,''),(328,'title',0,1,' welcome logo 2x '),(329,'extension',0,1,' png '),(329,'filename',0,1,' temp folder png '),(329,'kind',0,1,' image '),(329,'slug',0,1,''),(329,'title',0,1,' temp folder '),(330,'extension',0,1,' png '),(330,'filename',0,1,' craft png '),(330,'kind',0,1,' image '),(330,'slug',0,1,''),(330,'title',0,1,' craft '),(331,'extension',0,1,' png '),(331,'filename',0,1,' hudtip bottom png '),(331,'kind',0,1,' image '),(331,'slug',0,1,''),(331,'title',0,1,' hudtip bottom '),(332,'extension',0,1,' png '),(332,'filename',0,1,' hudtip bottom gray 2x png '),(332,'kind',0,1,' image '),(332,'slug',0,1,''),(332,'title',0,1,' hudtip bottom gray 2x '),(333,'extension',0,1,' png '),(333,'filename',0,1,' listview sort 2x png '),(333,'kind',0,1,' image '),(333,'slug',0,1,''),(333,'title',0,1,' listview sort 2x '),(334,'extension',0,1,' png '),(334,'filename',0,1,' welcome logo png '),(334,'kind',0,1,' image '),(334,'slug',0,1,''),(334,'title',0,1,' welcome logo '),(335,'extension',0,1,' png '),(335,'filename',0,1,' resizehandle 2x png '),(335,'kind',0,1,' image '),(335,'slug',0,1,''),(335,'title',0,1,' resizehandle 2x '),(336,'extension',0,1,' png '),(336,'filename',0,1,' hudtip top 2x png '),(336,'kind',0,1,' image '),(336,'slug',0,1,''),(336,'title',0,1,' hudtip top 2x '),(337,'extension',0,1,' png '),(337,'filename',0,1,' hudtip top png '),(337,'kind',0,1,' image '),(337,'slug',0,1,''),(337,'title',0,1,' hudtip top '),(338,'extension',0,1,' png '),(338,'filename',0,1,' resizehandle png '),(338,'kind',0,1,' image '),(338,'slug',0,1,''),(338,'title',0,1,' resizehandle '),(339,'extension',0,1,' svg '),(339,'filename',0,1,' safari pinned tab svg '),(339,'kind',0,1,' image '),(339,'slug',0,1,''),(339,'title',0,1,' safari pinned tab '),(340,'extension',0,1,' svg '),(340,'filename',0,1,' icon svg '),(340,'kind',0,1,' image '),(340,'slug',0,1,''),(340,'title',0,1,' icon '),(341,'extension',0,1,' png '),(341,'filename',0,1,' apple touch icon png '),(341,'kind',0,1,' image '),(341,'slug',0,1,''),(341,'title',0,1,' apple touch icon '),(342,'extension',0,1,' png '),(342,'filename',0,1,' success png '),(342,'kind',0,1,' image '),(342,'slug',0,1,''),(342,'title',0,1,' success '),(343,'extension',0,1,' svg '),(343,'filename',0,1,' filters svg '),(343,'kind',0,1,' image '),(343,'slug',0,1,''),(343,'title',0,1,' filters '),(344,'extension',0,1,' svg '),(344,'filename',0,1,' orientation landscape unchecked svg '),(344,'kind',0,1,' image '),(344,'slug',0,1,''),(344,'title',0,1,' orientation landscape unchecked '),(345,'extension',0,1,' svg '),(345,'filename',0,1,' flip horizontal svg '),(345,'kind',0,1,' image '),(345,'slug',0,1,''),(345,'title',0,1,' flip horizontal '),(346,'extension',0,1,' svg '),(346,'filename',0,1,' check svg '),(346,'kind',0,1,' image '),(346,'slug',0,1,''),(346,'title',0,1,' check '),(347,'extension',0,1,' svg '),(347,'filename',0,1,' flip vertical svg '),(347,'kind',0,1,' image '),(347,'slug',0,1,''),(347,'title',0,1,' flip vertical '),(348,'extension',0,1,' svg '),(348,'filename',0,1,' orientation landscape checked svg '),(348,'kind',0,1,' image '),(348,'slug',0,1,''),(348,'title',0,1,' orientation landscape checked '),(349,'extension',0,1,' svg '),(349,'filename',0,1,' focal point svg '),(349,'kind',0,1,' image '),(349,'slug',0,1,''),(349,'title',0,1,' focal point '),(350,'extension',0,1,' svg '),(350,'filename',0,1,' crop svg '),(350,'kind',0,1,' image '),(350,'slug',0,1,''),(350,'title',0,1,' crop '),(351,'extension',0,1,' svg '),(351,'filename',0,1,' unconstrained svg '),(351,'kind',0,1,' image '),(351,'slug',0,1,''),(351,'title',0,1,' unconstrained '),(352,'extension',0,1,' svg '),(352,'filename',0,1,' rotate left svg '),(352,'kind',0,1,' image '),(352,'slug',0,1,''),(352,'title',0,1,' rotate left '),(353,'extension',0,1,' svg '),(353,'filename',0,1,' orientation portrait unchecked svg '),(353,'kind',0,1,' image '),(353,'slug',0,1,''),(353,'title',0,1,' orientation portrait unchecked '),(354,'extension',0,1,' svg '),(354,'filename',0,1,' rotate right svg '),(354,'kind',0,1,' image '),(354,'slug',0,1,''),(354,'title',0,1,' rotate right '),(355,'extension',0,1,' svg '),(355,'filename',0,1,' orientation portrait checked svg '),(355,'kind',0,1,' image '),(355,'slug',0,1,''),(355,'title',0,1,' orientation portrait checked '),(356,'extension',0,1,' jpg '),(356,'filename',0,1,' prg jpg '),(356,'kind',0,1,' image '),(356,'slug',0,1,''),(356,'title',0,1,' prg '),(357,'extension',0,1,' png '),(357,'filename',0,1,' hudtip left png '),(357,'kind',0,1,' image '),(357,'slug',0,1,''),(357,'title',0,1,' hudtip left '),(358,'extension',0,1,' png '),(358,'filename',0,1,' success 2x png '),(358,'kind',0,1,' image '),(358,'slug',0,1,''),(358,'title',0,1,' success 2x '),(359,'extension',0,1,' png '),(359,'filename',0,1,' hudtip bottom 2x png '),(359,'kind',0,1,' image '),(359,'slug',0,1,''),(359,'title',0,1,' hudtip bottom 2x '),(360,'extension',0,1,' svg '),(360,'filename',0,1,' craftcms svg '),(360,'kind',0,1,' image '),(360,'slug',0,1,''),(360,'title',0,1,' craftcms '),(361,'extension',0,1,' png '),(361,'filename',0,1,' hudtip left 2x png '),(361,'kind',0,1,' image '),(361,'slug',0,1,''),(361,'title',0,1,' hudtip left 2x '),(362,'extension',0,1,' svg '),(362,'filename',0,1,' dev mode svg '),(362,'kind',0,1,' image '),(362,'slug',0,1,''),(362,'title',0,1,' dev mode '),(363,'extension',0,1,' png '),(363,'filename',0,1,' branch rtl png '),(363,'kind',0,1,' image '),(363,'slug',0,1,''),(363,'title',0,1,' branch rtl '),(364,'extension',0,1,' png '),(364,'filename',0,1,' craft 2x png '),(364,'kind',0,1,' image '),(364,'slug',0,1,''),(364,'title',0,1,' craft 2x '),(365,'extension',0,1,' png '),(365,'filename',0,1,' listview sort png '),(365,'kind',0,1,' image '),(365,'slug',0,1,''),(365,'title',0,1,' listview sort '),(366,'extension',0,1,' png '),(366,'filename',0,1,' branch rtl 2x png '),(366,'kind',0,1,' image '),(366,'slug',0,1,''),(366,'title',0,1,' branch rtl 2x '),(367,'extension',0,1,' png '),(367,'filename',0,1,' hudtip right 2x png '),(367,'kind',0,1,' image '),(367,'slug',0,1,''),(367,'title',0,1,' hudtip right 2x '),(368,'extension',0,1,' png '),(368,'filename',0,1,' branch png '),(368,'kind',0,1,' image '),(368,'slug',0,1,''),(368,'title',0,1,' branch '),(369,'extension',0,1,' png '),(369,'filename',0,1,' hudtip bottom gray png '),(369,'kind',0,1,' image '),(369,'slug',0,1,''),(369,'title',0,1,' hudtip bottom gray '),(370,'extension',0,1,' png '),(370,'filename',0,1,' branch 2x png '),(370,'kind',0,1,' image '),(370,'slug',0,1,''),(370,'title',0,1,' branch 2x '),(371,'extension',0,1,' js '),(371,'filename',0,1,' cp js '),(371,'kind',0,1,' javascript '),(371,'slug',0,1,''),(371,'title',0,1,' cp '),(372,'extension',0,1,' svg '),(372,'filename',0,1,' craft svg '),(372,'kind',0,1,' image '),(372,'slug',0,1,''),(372,'title',0,1,' craft '),(373,'extension',0,1,' js '),(373,'filename',0,1,' feedwidget js '),(373,'kind',0,1,' javascript '),(373,'slug',0,1,''),(373,'title',0,1,' feed widget '),(374,'extension',0,1,' js '),(374,'filename',0,1,' updateswidget js '),(374,'kind',0,1,' javascript '),(374,'slug',0,1,''),(374,'title',0,1,' updates widget '),(375,'extension',0,1,' txt '),(375,'filename',0,1,' axios js license txt '),(375,'kind',0,1,' text '),(375,'slug',0,1,''),(375,'title',0,1,' axios js license '),(376,'extension',0,1,' js '),(376,'filename',0,1,' axios js '),(376,'kind',0,1,' javascript '),(376,'slug',0,1,''),(376,'title',0,1,' axios '),(377,'extension',0,1,' js '),(377,'filename',0,1,' jquery mobile events js '),(377,'kind',0,1,' javascript '),(377,'slug',0,1,''),(377,'title',0,1,' jquery mobile events '),(378,'extension',0,1,' txt '),(378,'filename',0,1,' jquery mobile events js license txt '),(378,'kind',0,1,' text '),(378,'slug',0,1,''),(378,'title',0,1,' jquery mobile events js license '),(379,'extension',0,1,' js '),(379,'filename',0,1,' iframeresizer contentwindow js '),(379,'kind',0,1,' javascript '),(379,'slug',0,1,''),(379,'title',0,1,' iframe resizer content window '),(380,'extension',0,1,' js '),(380,'filename',0,1,' iframeresizer js '),(380,'kind',0,1,' javascript '),(380,'slug',0,1,''),(380,'title',0,1,' iframe resizer '),(381,'extension',0,1,' png '),(381,'filename',0,1,' db png '),(381,'kind',0,1,' image '),(381,'slug',0,1,''),(381,'title',0,1,' db '),(382,'extension',0,1,' png '),(382,'filename',0,1,' account png '),(382,'kind',0,1,' image '),(382,'slug',0,1,''),(382,'title',0,1,' account '),(383,'extension',0,1,' png '),(383,'filename',0,1,' site png '),(383,'kind',0,1,' image '),(383,'slug',0,1,''),(383,'title',0,1,' site '),(384,'extension',0,1,' png '),(384,'filename',0,1,' installer bg png '),(384,'kind',0,1,' image '),(384,'slug',0,1,''),(384,'title',0,1,' installer bg '),(385,'extension',0,1,' js '),(385,'filename',0,1,' install js '),(385,'kind',0,1,' javascript '),(385,'slug',0,1,''),(385,'title',0,1,' install '),(386,'extension',0,1,' js '),(386,'filename',0,1,' prism js '),(386,'kind',0,1,' javascript '),(386,'slug',0,1,''),(386,'title',0,1,' prism '),(387,'extension',0,1,' txt '),(387,'filename',0,1,' jquery js license txt '),(387,'kind',0,1,' text '),(387,'slug',0,1,''),(387,'title',0,1,' jquery js license '),(388,'extension',0,1,' js '),(388,'filename',0,1,' jquery js '),(388,'kind',0,1,' javascript '),(388,'slug',0,1,''),(388,'title',0,1,' jquery '),(389,'extension',0,1,' js '),(389,'filename',0,1,' vue js '),(389,'kind',0,1,' javascript '),(389,'slug',0,1,''),(389,'title',0,1,' vue '),(390,'extension',0,1,' txt '),(390,'filename',0,1,' vue js license txt '),(390,'kind',0,1,' text '),(390,'slug',0,1,''),(390,'title',0,1,' vue js license '),(391,'extension',0,1,' json '),(391,'filename',0,1,' manifest json '),(391,'kind',0,1,' json '),(391,'slug',0,1,''),(391,'title',0,1,' manifest '),(392,'extension',0,1,' js '),(392,'filename',0,1,' queue manager js '),(392,'kind',0,1,' javascript '),(392,'slug',0,1,''),(392,'title',0,1,' queue manager '),(393,'extension',0,1,' txt '),(393,'filename',0,1,' queue manager js license txt '),(393,'kind',0,1,' text '),(393,'slug',0,1,''),(393,'title',0,1,' queue manager js license '),(394,'extension',0,1,' js '),(394,'filename',0,1,' utilities js '),(394,'kind',0,1,' javascript '),(394,'slug',0,1,''),(394,'title',0,1,' utilities '),(395,'extension',0,1,' js '),(395,'filename',0,1,' craftsupportwidget js '),(395,'kind',0,1,' javascript '),(395,'slug',0,1,''),(395,'title',0,1,' craft support widget '),(396,'extension',0,1,' svg '),(396,'filename',0,1,' craft partners svg '),(396,'kind',0,1,' image '),(396,'slug',0,1,''),(396,'title',0,1,' craft partners '),(397,'extension',0,1,' svg '),(397,'filename',0,1,' craftquest svg '),(397,'kind',0,1,' image '),(397,'slug',0,1,''),(397,'title',0,1,' craftquest '),(398,'extension',0,1,' svg '),(398,'filename',0,1,' discord svg '),(398,'kind',0,1,' image '),(398,'slug',0,1,''),(398,'title',0,1,' discord '),(399,'extension',0,1,' jpeg '),(399,'filename',0,1,' rami jpeg '),(399,'kind',0,1,' image '),(399,'slug',0,1,''),(399,'title',0,1,' rami '),(400,'extension',0,1,' jpeg '),(400,'filename',0,1,' do research jpeg '),(400,'kind',0,1,' image '),(400,'slug',0,1,''),(400,'title',0,1,' do research '),(401,'extension',0,1,' jpeg '),(401,'filename',0,1,' rami jpeg '),(401,'kind',0,1,' image '),(401,'slug',0,1,''),(401,'title',0,1,' rami ');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sitegroups` VALUES (1,'$CRAFT_SITE_NAME','2023-02-02 05:28:23','2023-02-02 20:38:11',NULL,'0d89c679-f6f5-42ae-8341-4bea917c6af7');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sites` VALUES (1,1,1,'1','$CRAFT_SITE_NAME','default','en-US',1,'$PRIMARY_SITE_URL',1,'2023-02-02 05:28:23','2023-02-02 20:37:47',NULL,'f255ef6d-0c55-4bdc-9ced-f610bbb3bed6');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `userpreferences` VALUES (1,'{\"language\":\"en-US\"}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `users` VALUES (1,NULL,1,0,0,0,1,'admin',NULL,NULL,NULL,'info@nystudio107.com','$2y$13$crqJ.kzM.kBs.WsWGUxT9uUdR4Imi./d9prVKVya/MkWu/Bd/8.Ga','2023-02-18 03:25:08',NULL,NULL,NULL,'2023-02-02 05:28:58',NULL,1,NULL,NULL,NULL,0,'2023-02-02 05:28:24','2023-02-02 05:28:24','2023-02-18 03:25:08');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumefolders` VALUES (1,NULL,1,'Site','','2023-02-08 03:29:07','2023-02-08 03:29:07','7954bead-7512-4fd1-a9a8-e375a636a0cf'),(2,NULL,NULL,'Temporary filesystem',NULL,'2023-02-08 03:29:10','2023-02-08 03:29:10','c7bf48fc-0cf0-4926-a81f-083eb2e3f103'),(3,2,NULL,'user_1','user_1/','2023-02-08 03:29:10','2023-02-08 03:29:10','9a77b1c8-3e6e-4ec5-8b82-e25effa55d90'),(4,NULL,2,'Site','','2023-02-08 03:43:40','2023-02-08 03:43:40','8bffc4b4-6a98-4d28-87e0-617c2a1e4eea'),(5,4,2,'cpresources','cpresources/','2023-02-08 03:54:58','2023-02-08 03:54:58','e1974805-f979-473e-95ed-27a31dd34d4f'),(6,5,2,'7e9683c2','cpresources/7e9683c2/','2023-02-08 03:54:58','2023-02-08 03:54:58','371e4271-7763-4582-a9a9-8b54b7e66e1f'),(7,6,2,'css','cpresources/7e9683c2/css/','2023-02-08 03:54:58','2023-02-08 03:54:58','768f96db-2dab-4179-a852-b1af716643d1'),(8,5,2,'3aa44f89','cpresources/3aa44f89/','2023-02-08 03:54:58','2023-02-08 03:54:58','0b5a8208-6fd0-4350-8b7b-b374d576239b'),(9,5,2,'6a40014d','cpresources/6a40014d/','2023-02-08 03:54:58','2023-02-08 03:54:58','ed5d36e5-c7c4-4757-b14a-f37ff0f4e849'),(10,5,2,'9f27919c','cpresources/9f27919c/','2023-02-08 03:54:58','2023-02-08 03:54:58','4797543e-ee16-4762-93ee-4cb5392d4a26'),(11,10,2,'d3-format','cpresources/9f27919c/d3-format/','2023-02-08 03:54:58','2023-02-08 03:54:58','3786279a-8add-4ad5-b44e-2f8d930a0dfa'),(12,11,2,'locale','cpresources/9f27919c/d3-format/locale/','2023-02-08 03:54:58','2023-02-08 03:54:58','26ea5a04-0c37-4b5d-91f2-c20287c38072'),(13,10,2,'d3-time-format','cpresources/9f27919c/d3-time-format/','2023-02-08 03:55:01','2023-02-08 03:55:01','3393b1a6-4bb2-40cd-b0e3-702fd5a5a65b'),(14,13,2,'locale','cpresources/9f27919c/d3-time-format/locale/','2023-02-08 03:55:01','2023-02-08 03:55:01','0102b683-d46a-4697-8434-317a1b50fdc5'),(15,5,2,'7732ff7','cpresources/7732ff7/','2023-02-08 03:55:02','2023-02-08 03:55:02','f9a7bb05-3549-49c0-a39b-0fe24b896e6d'),(16,5,2,'510e1389','cpresources/510e1389/','2023-02-08 03:55:02','2023-02-08 03:55:02','ba6102db-3008-48d8-8748-1179bc96d26e'),(17,5,2,'8e4fafbf','cpresources/8e4fafbf/','2023-02-08 03:55:02','2023-02-08 03:55:02','1804ca0a-48e1-40ac-b1d5-b82fcfa5da60'),(18,17,2,'css','cpresources/8e4fafbf/css/','2023-02-08 03:55:02','2023-02-08 03:55:02','d3729f83-505c-4ed1-b72e-cd67b75bbf09'),(19,5,2,'5e099c77','cpresources/5e099c77/','2023-02-08 03:55:02','2023-02-08 03:55:02','b187c4a2-271a-4d59-80b6-268ef7efda57'),(20,5,2,'4f75c522','cpresources/4f75c522/','2023-02-08 03:55:02','2023-02-08 03:55:02','7866eb29-81a8-4b03-8b05-a30f8ebbb16c'),(21,5,2,'e7782e36','cpresources/e7782e36/','2023-02-08 03:55:02','2023-02-08 03:55:02','978f2b75-c59a-4357-87f0-88220d1315e5'),(22,5,2,'311cf289','cpresources/311cf289/','2023-02-08 03:55:02','2023-02-08 03:55:02','e435605b-1158-444b-b1c2-52fdefe87f6f'),(23,5,2,'895a159d','cpresources/895a159d/','2023-02-08 03:55:02','2023-02-08 03:55:02','8dab69b0-6fe8-4a8f-ad11-124df4bee26b'),(24,23,2,'css','cpresources/895a159d/css/','2023-02-08 03:55:03','2023-02-08 03:55:03','1aa0ace2-f562-4fe1-bd8f-e8c7104e3e6d'),(25,5,2,'d472857','cpresources/d472857/','2023-02-08 03:55:03','2023-02-08 03:55:03','475f40d1-ea66-4699-a710-d1de32e13a9b'),(26,5,2,'30c62f80','cpresources/30c62f80/','2023-02-08 03:55:03','2023-02-08 03:55:03','bb388d57-eefd-42fb-923b-3a0935aa6b8d'),(27,26,2,'css','cpresources/30c62f80/css/','2023-02-08 03:55:03','2023-02-08 03:55:03','a518484a-0174-4662-aa40-5df856500494'),(28,5,2,'a251447e','cpresources/a251447e/','2023-02-08 03:55:03','2023-02-08 03:55:03','9c32aed5-9135-4cfe-81aa-aa90d4133f10'),(29,5,2,'8d02ae0','cpresources/8d02ae0/','2023-02-08 03:55:03','2023-02-08 03:55:03','a8da0e26-66ef-4d78-a538-3ca717d141b6'),(30,5,2,'a1d62c2a','cpresources/a1d62c2a/','2023-02-08 03:55:03','2023-02-08 03:55:03','a5f931cd-2e93-4c8f-a40e-f2e4b3244d1d'),(31,5,2,'cfca1921','cpresources/cfca1921/','2023-02-08 03:55:03','2023-02-08 03:55:03','112b5866-6d0d-4e91-81ff-204456b630d7'),(32,5,2,'f6f66dc9','cpresources/f6f66dc9/','2023-02-08 03:55:03','2023-02-08 03:55:03','53f4cc75-09ba-44f8-8cc6-09aade6fdb5e'),(33,32,2,'js','cpresources/f6f66dc9/js/','2023-02-08 03:55:03','2023-02-08 03:55:03','4531274b-bd46-45f4-bb14-e0f83811e9a6'),(34,32,2,'css','cpresources/f6f66dc9/css/','2023-02-08 03:55:03','2023-02-08 03:55:03','9f15104b-968c-4dc6-9dd5-5c45c9067056'),(35,5,2,'8512b7d5','cpresources/8512b7d5/','2023-02-08 03:55:03','2023-02-08 03:55:03','415d0034-c8a2-4e09-bcf5-05ee7328879f'),(36,35,2,'images','cpresources/8512b7d5/images/','2023-02-08 03:55:03','2023-02-08 03:55:03','8938d283-d9a3-4fa2-afe0-9d84af998f6f'),(37,36,2,'preview','cpresources/8512b7d5/images/preview/','2023-02-08 03:55:04','2023-02-08 03:55:04','5b44b25f-37c4-4c7c-8a80-c2d8c885764f'),(38,36,2,'icons','cpresources/8512b7d5/images/icons/','2023-02-08 03:55:04','2023-02-08 03:55:04','27373a57-6e69-4b18-8c68-f47d0078e6e9'),(39,36,2,'image-editor','cpresources/8512b7d5/images/image-editor/','2023-02-08 03:55:05','2023-02-08 03:55:05','8af8deee-e103-4f67-8ae0-5da2c9a24419'),(40,35,2,'fonts','cpresources/8512b7d5/fonts/','2023-02-08 03:55:06','2023-02-08 03:55:06','3988a4c9-c9a7-4d66-8729-6951b29cc89a'),(41,35,2,'css','cpresources/8512b7d5/css/','2023-02-08 03:55:06','2023-02-08 03:55:06','c19f2209-ee1d-4dc1-9612-321a9342169a'),(42,5,2,'7d5a509','cpresources/7d5a509/','2023-02-08 03:55:06','2023-02-08 03:55:06','da0e3a34-eab4-4ff0-b5c2-a4c2ba28ddf3'),(43,5,2,'9f6c6e44','cpresources/9f6c6e44/','2023-02-08 03:55:06','2023-02-08 03:55:06','b00b7d10-0ef9-406a-8f3b-4afe33c529ee'),(44,5,2,'b923b973','cpresources/b923b973/','2023-02-08 03:55:06','2023-02-08 03:55:06','3485882f-83b1-414d-9354-8da23c22f0db'),(45,5,2,'d14f735','cpresources/d14f735/','2023-02-08 03:55:06','2023-02-08 03:55:06','195d1ef3-c2ea-4f9e-8be6-5bbca4be3ed0'),(46,5,2,'9446982b','cpresources/9446982b/','2023-02-08 03:55:06','2023-02-08 03:55:06','3ca60a73-9944-4c2d-87ee-dc5870c2cde1'),(47,5,2,'886eec03','cpresources/886eec03/','2023-02-08 03:55:07','2023-02-08 03:55:07','ea7ba2d3-cdd1-4a88-8cc0-dfd37c9f235a'),(48,47,2,'images','cpresources/886eec03/images/','2023-02-08 03:55:07','2023-02-08 03:55:07','b11a4bc3-6178-4dc6-b23e-f20eda1b65bb'),(49,47,2,'css','cpresources/886eec03/css/','2023-02-08 03:55:07','2023-02-08 03:55:07','2bab255c-2bf2-4f56-8000-6a089ee76396'),(50,5,2,'44fde64b','cpresources/44fde64b/','2023-02-08 03:55:07','2023-02-08 03:55:07','08763424-ad72-44eb-bb99-cb7bd6d38da2'),(51,5,2,'5be9839f','cpresources/5be9839f/','2023-02-08 03:55:07','2023-02-08 03:55:07','a98bfdbc-2bf6-4e3a-b1f9-3f4acaf97820'),(52,5,2,'1cf0f2bb','cpresources/1cf0f2bb/','2023-02-08 03:55:07','2023-02-08 03:55:07','0c142362-998e-4739-85d4-3760e21fc691'),(53,5,2,'d803753f','cpresources/d803753f/','2023-02-08 03:55:07','2023-02-08 03:55:07','ccf2cc19-b16a-4a86-a38c-5146bd59ee07'),(54,5,2,'dfe08f1f','cpresources/dfe08f1f/','2023-02-08 03:55:08','2023-02-08 03:55:08','26a302c1-9f95-4974-bc34-1e3743581ab5'),(55,54,2,'css','cpresources/dfe08f1f/css/','2023-02-08 03:55:08','2023-02-08 03:55:08','5aa3ad5d-e193-4c8c-8126-fe7896f8f251'),(56,5,2,'38c0984d','cpresources/38c0984d/','2023-02-08 03:55:08','2023-02-08 03:55:08','f335b086-1e12-44c1-bf20-51cd52fe58a6'),(57,56,2,'logos','cpresources/38c0984d/logos/','2023-02-08 03:55:08','2023-02-08 03:55:08','32e679e0-8e52-4880-b935-0685c4faf908'),(58,56,2,'css','cpresources/38c0984d/css/','2023-02-08 03:55:08','2023-02-08 03:55:08','81c6e870-5a70-40ea-b4b7-64106645b81b'),(59,NULL,3,'Site','','2023-02-08 06:11:59','2023-02-08 06:11:59','bc145d07-8541-4d68-bc8e-6ff51c5a571a'),(60,59,3,'cpresources','cpresources/','2023-02-08 06:23:29','2023-02-08 06:23:29','30e9a0b1-b89f-406b-a4d8-f62e6cf36d95'),(61,60,3,'7e9683c2','cpresources/7e9683c2/','2023-02-08 06:23:29','2023-02-08 06:23:29','074be141-56d1-40d5-8d26-0452002a0d95'),(62,61,3,'css','cpresources/7e9683c2/css/','2023-02-08 06:23:29','2023-02-08 06:23:29','2cc0c409-2aaa-4d3b-b7e0-332fd8bd4286'),(63,60,3,'3aa44f89','cpresources/3aa44f89/','2023-02-08 06:23:29','2023-02-08 06:23:29','134e5ab1-2f76-4054-8def-2cf8164af32e'),(64,60,3,'6a40014d','cpresources/6a40014d/','2023-02-08 06:23:29','2023-02-08 06:23:29','aace6b56-50fe-4490-866c-658a17796dfe'),(65,60,3,'9f27919c','cpresources/9f27919c/','2023-02-08 06:23:29','2023-02-08 06:23:29','f812844b-f514-41e0-9091-3084aad746b1'),(66,65,3,'d3-format','cpresources/9f27919c/d3-format/','2023-02-08 06:23:29','2023-02-08 06:23:29','2502db35-18f5-4933-aab1-2168f797cece'),(67,66,3,'locale','cpresources/9f27919c/d3-format/locale/','2023-02-08 06:23:29','2023-02-08 06:23:29','216900a3-7ca4-4375-a5a8-082fa3e8eb20'),(68,65,3,'d3-time-format','cpresources/9f27919c/d3-time-format/','2023-02-08 06:23:31','2023-02-08 06:23:31','e3fffa66-c9a3-4ed3-bead-58705773f884'),(69,68,3,'locale','cpresources/9f27919c/d3-time-format/locale/','2023-02-08 06:23:31','2023-02-08 06:23:31','50f181c9-3140-4756-a9dc-2b56bf85266f'),(70,60,3,'7732ff7','cpresources/7732ff7/','2023-02-08 06:23:32','2023-02-08 06:23:32','24390993-fbc1-4230-9127-98a500ef575e'),(71,60,3,'510e1389','cpresources/510e1389/','2023-02-08 06:23:32','2023-02-08 06:23:32','8ab28e57-a2ea-4c4a-a5f0-89a00266f333'),(72,60,3,'8e4fafbf','cpresources/8e4fafbf/','2023-02-08 06:23:32','2023-02-08 06:23:32','b7afcc2f-875f-4619-933a-fe43e672e5a8'),(73,72,3,'css','cpresources/8e4fafbf/css/','2023-02-08 06:23:33','2023-02-08 06:23:33','b59e1c47-11b8-4e84-9ba1-4b9b81878ba2'),(74,60,3,'5e099c77','cpresources/5e099c77/','2023-02-08 06:23:33','2023-02-08 06:23:33','79f69f5f-097b-4a50-a458-64f7beec16d7'),(75,60,3,'4f75c522','cpresources/4f75c522/','2023-02-08 06:23:33','2023-02-08 06:23:33','bf1db469-3ed2-48dc-8d1d-4057083c9622'),(76,60,3,'e7782e36','cpresources/e7782e36/','2023-02-08 06:23:33','2023-02-08 06:23:33','76fb8bfd-7b54-4c84-8806-72893b8519a7'),(77,60,3,'311cf289','cpresources/311cf289/','2023-02-08 06:23:33','2023-02-08 06:23:33','55cc956c-098a-40be-9b97-4aef64b203c0'),(78,60,3,'895a159d','cpresources/895a159d/','2023-02-08 06:23:33','2023-02-08 06:23:33','aba40f3d-8c09-46af-bbc9-4c8390d7ef3c'),(79,78,3,'css','cpresources/895a159d/css/','2023-02-08 06:23:33','2023-02-08 06:23:33','066e89f0-8ddd-4856-b461-7e6feb99df32'),(80,60,3,'d472857','cpresources/d472857/','2023-02-08 06:23:33','2023-02-08 06:23:33','764f2ee8-08a7-4003-aa85-2fdfefd1d860'),(81,60,3,'30c62f80','cpresources/30c62f80/','2023-02-08 06:23:33','2023-02-08 06:23:33','b1d13b0a-8cbf-4a52-be7c-514be990633e'),(82,81,3,'css','cpresources/30c62f80/css/','2023-02-08 06:23:33','2023-02-08 06:23:33','3459293b-5f34-4f12-8904-ff0e2729e07e'),(83,60,3,'a251447e','cpresources/a251447e/','2023-02-08 06:23:33','2023-02-08 06:23:33','77f25603-f4cf-4d9b-810c-89e5c9d18cea'),(84,60,3,'8d02ae0','cpresources/8d02ae0/','2023-02-08 06:23:33','2023-02-08 06:23:33','50183d07-7c8d-4d54-a652-4535f2dd7ed3'),(85,60,3,'a1d62c2a','cpresources/a1d62c2a/','2023-02-08 06:23:33','2023-02-08 06:23:33','871051ea-322e-411a-a7a5-48ea8444bc0e'),(86,60,3,'cfca1921','cpresources/cfca1921/','2023-02-08 06:23:34','2023-02-08 06:23:34','b48ce67a-02d2-418a-87a0-e6d1789b99c8'),(87,60,3,'f6f66dc9','cpresources/f6f66dc9/','2023-02-08 06:23:34','2023-02-08 06:23:34','1d4c9409-a6e6-4f69-a76c-fbe2973bbf40'),(88,87,3,'js','cpresources/f6f66dc9/js/','2023-02-08 06:23:34','2023-02-08 06:23:34','ea1f9d0f-d736-4924-924e-db7d8e6ff37b'),(89,87,3,'css','cpresources/f6f66dc9/css/','2023-02-08 06:23:34','2023-02-08 06:23:34','627d7179-4a6b-4854-9c9f-e87a64b58e74'),(90,60,3,'8512b7d5','cpresources/8512b7d5/','2023-02-08 06:23:34','2023-02-08 06:23:34','e3f726c4-47f3-4576-a1d0-0c40710ea77b'),(91,90,3,'images','cpresources/8512b7d5/images/','2023-02-08 06:23:34','2023-02-08 06:23:34','eef3de75-ea02-4aca-93a7-7f86470970c6'),(92,91,3,'preview','cpresources/8512b7d5/images/preview/','2023-02-08 06:23:34','2023-02-08 06:23:34','3120f37e-84b9-4c7f-991d-66261293f49c'),(93,91,3,'icons','cpresources/8512b7d5/images/icons/','2023-02-08 06:23:35','2023-02-08 06:23:35','4ae82b20-3bf0-4691-9cc2-d1f74c1ae517'),(94,91,3,'image-editor','cpresources/8512b7d5/images/image-editor/','2023-02-08 06:23:35','2023-02-08 06:23:35','d9efa505-9cbc-48dc-b3f5-3a684fb1eae6'),(95,90,3,'fonts','cpresources/8512b7d5/fonts/','2023-02-08 06:23:36','2023-02-08 06:23:36','c6010473-14f1-4071-8f5c-ae6fce8d81d0'),(96,90,3,'css','cpresources/8512b7d5/css/','2023-02-08 06:23:36','2023-02-08 06:23:36','fff7b371-4880-4f94-b96f-362a7db1e617'),(97,60,3,'7d5a509','cpresources/7d5a509/','2023-02-08 06:23:36','2023-02-08 06:23:36','3c3a1e6d-c335-466b-a771-bfeccc98c786'),(98,60,3,'9f6c6e44','cpresources/9f6c6e44/','2023-02-08 06:23:36','2023-02-08 06:23:36','182f474c-532a-4f0b-b10a-bb775194a0fc'),(99,60,3,'b923b973','cpresources/b923b973/','2023-02-08 06:23:37','2023-02-08 06:23:37','2cb59100-a54d-4eaa-a771-83b6eee0bb99'),(100,60,3,'d14f735','cpresources/d14f735/','2023-02-08 06:23:37','2023-02-08 06:23:37','5e95bcd3-9a09-439f-975d-0e37eb794062'),(101,60,3,'9446982b','cpresources/9446982b/','2023-02-08 06:23:37','2023-02-08 06:23:37','eb2a4d9e-bbd5-4516-b0b0-9fd954221161'),(102,60,3,'886eec03','cpresources/886eec03/','2023-02-08 06:23:37','2023-02-08 06:23:37','53f074b3-b04d-4ec8-96df-17c15acb4290'),(103,102,3,'images','cpresources/886eec03/images/','2023-02-08 06:23:37','2023-02-08 06:23:37','2252c739-b3be-415d-9f94-76ceb899fbe0'),(104,102,3,'css','cpresources/886eec03/css/','2023-02-08 06:23:37','2023-02-08 06:23:37','42171865-ef4f-4aa3-8aae-2aa767fb22cf'),(105,60,3,'44fde64b','cpresources/44fde64b/','2023-02-08 06:23:37','2023-02-08 06:23:37','4c33ed12-fd12-4ea8-ad7c-a4da035458cd'),(106,60,3,'5be9839f','cpresources/5be9839f/','2023-02-08 06:23:37','2023-02-08 06:23:37','4f35a5c4-50e4-4199-86a4-917deacd3f08'),(107,60,3,'1cf0f2bb','cpresources/1cf0f2bb/','2023-02-08 06:23:37','2023-02-08 06:23:37','3a29afe8-ea07-47ac-8e51-63656cde9d19'),(108,60,3,'d803753f','cpresources/d803753f/','2023-02-08 06:23:38','2023-02-08 06:23:38','82c1b278-76e0-4765-9ef3-27ee39eb8433'),(109,60,3,'dfe08f1f','cpresources/dfe08f1f/','2023-02-08 06:23:38','2023-02-08 06:23:38','382674ec-1b70-491f-9cc4-a22fa1b9e3f4'),(110,109,3,'css','cpresources/dfe08f1f/css/','2023-02-08 06:23:38','2023-02-08 06:23:38','f971c77c-ad66-4f71-897e-0262eba0e629'),(111,60,3,'38c0984d','cpresources/38c0984d/','2023-02-08 06:23:38','2023-02-08 06:23:38','e109ff1c-5eca-46dd-8317-0e88f00c61be'),(112,111,3,'logos','cpresources/38c0984d/logos/','2023-02-08 06:23:38','2023-02-08 06:23:38','c37d3b96-7ce2-45ed-9b41-1e88ccc2c720'),(113,111,3,'css','cpresources/38c0984d/css/','2023-02-08 06:23:38','2023-02-08 06:23:38','4b869706-8243-4dc4-a176-c4111904dcfe');
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumes` VALUES (1,1,'Site','site','site','','','site',NULL,1,'2023-02-08 03:29:07','2023-02-08 03:29:07','2023-02-08 03:42:36','f1e4b2eb-dc38-4ad8-84ad-21f3b3d77b5c'),(2,2,'Site','site','site','','','site',NULL,2,'2023-02-08 03:43:40','2023-02-08 03:43:40','2023-02-08 05:14:43','d5560f04-30c7-44c4-bb4a-e0818cae1130'),(3,3,'Site','site','site','','','site',NULL,3,'2023-02-08 06:11:59','2023-02-08 06:11:59','2023-02-08 14:19:31','4e23983a-4146-4e63-9e2b-ee3b32b07f12');
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"siteId\":1,\"section\":\"*\",\"limit\":10}',1,'2023-02-02 05:29:03','2023-02-02 05:29:03','c53fbd79-71b8-4d8f-8c28-79fa730418d5'),(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2023-02-02 05:29:03','2023-02-02 05:29:03','0882d0b5-810a-4e9e-adcc-3c52d35c6cee'),(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2023-02-02 05:29:03','2023-02-02 05:29:03','b306bd06-fcad-4702-9075-fae37ad18291'),(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2023-02-02 05:29:03','2023-02-02 05:29:03','70fc0edf-2bdd-4a72-ae90-5e6bb14e89d8');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping routines for database 'project'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-18  3:25:33
