DROP TABLE IF EXISTS `applied`;
CREATE TABLE `applied` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spell_id` int(11) NOT NULL,
  `effect_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `spell_id` (`spell_id`,`effect_id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=latin1;
LOCK TABLES `applied` WRITE;
INSERT INTO `applied` VALUES (1,1,28),(2,2,22),(4,4,6),(3,4,21),(5,5,26),(7,9,22),(6,10,4),(8,12,12),(9,14,20),(10,15,12),(11,15,25),(12,16,25),(13,18,25),(14,19,19),(15,20,11),(16,20,26),(17,23,16),(18,24,26),(19,25,6),(20,25,28),(21,27,10),(22,29,24),(23,30,27),(25,31,20),(24,31,30),(26,32,11),(27,34,23),(28,37,21),(29,38,19),(30,39,7),(31,40,21),(32,41,2),(33,42,22),(64,43,14),(34,44,9),(35,45,5),(36,46,13),(37,46,21),(69,47,32),(38,49,5),(39,50,13),(40,50,25),(73,51,32),(41,52,5),(42,52,21),(43,53,5),(44,53,16),(45,54,8),(46,54,11),(47,55,25),(48,56,1),(49,57,8),(50,58,8),(84,59,33),(51,60,18),(52,61,8),(53,62,9),(89,64,15),(88,64,25),(54,71,22),(90,71,34),(91,72,35),(55,73,23),(56,74,6);
UNLOCK TABLES;
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
LOCK TABLES `class` WRITE;
INSERT INTO `class` VALUES (1,'Archery'),(2,'Artistry'),(3,'Conjury'),(4,'Devotion'),(5,'Finesse'),(6,'Necromancy'),(7,'Protection'),(8,'Sorcery'),(9,'Warfare'),(10,'Will');
UNLOCK TABLES;
DROP TABLE IF EXISTS `combo`;
CREATE TABLE `combo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spell_id` int(11) NOT NULL,
  `effect_id` int(11) NOT NULL,
  `applies_effect` int(11) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=latin1;
LOCK TABLES `combo` WRITE;
INSERT INTO `combo` VALUES (1,63,15,12,''),(2,13,9,19,'4 sec'),(3,13,19,9,'4 sec'),(4,37,11,25,''),(5,69,15,NULL,'AOE reduce enemy damage by 30%'),(6,68,15,NULL,'AOE reduce magic/physical defense'),(7,67,15,NULL,'200-242 AOE damage per sec'),(8,65,15,NULL,'AOE Slow'),(9,41,2,NULL,'Longer/stronger bleed'),(10,41,8,NULL,'Adds Deathwish stacks * 74 damage'),(11,41,18,NULL,'+27% damage'),(12,41,21,NULL,'Longer/stronger slow'),(13,22,27,NULL,'Increases magic defense'),(14,8,28,NULL,'+13% damage'),(15,10,12,NULL,'+55% damage'),(16,10,25,NULL,'Heals for 571-769'),(17,11,5,NULL,'Increased Bubble duration'),(18,11,32,NULL,'Adds 465-623 damage and does not break on damage'),(19,51,23,NULL,'+30% damage'),(20,73,23,NULL,'+45% damage'),(21,76,6,NULL,'Reduced cooldown by 1.2 per charge'),(22,66,15,NULL,'+37% damage'),(23,14,13,NULL,'Increased duration 10 sec'),(24,4,16,NULL,'+47% damage'),(25,32,12,NULL,'Immediately procs Exhausted'),(26,28,6,NULL,'+52% damage per change'),(27,28,26,NULL,'3 times threat'),(28,26,6,NULL,'+47% damage per charge'),(29,45,1,NULL,'Instant cast'),(30,45,4,NULL,'20% of damage gained as mana'),(31,45,5,NULL,'Better burning!'),(32,45,13,NULL,'+12% damage'),(33,49,13,NULL,'+44% damage'),(34,52,13,NULL,'+41% damage'),(35,37,2,NULL,'+30% damage'),(36,74,6,NULL,'Reduced cooldown by 2.1 per charge'),(37,74,35,NULL,'+30% heal'),(38,23,21,NULL,'+44% damage'),(39,61,2,NULL,'+35% damage'),(40,34,23,NULL,'+48% damage'),(41,43,8,NULL,'Adds Deathwish stacks * 50 damage'),(42,43,18,NULL,'+38% damage'),(43,46,5,NULL,'+15% damage'),(44,46,13,NULL,'+30sec on slow'),(45,46,20,NULL,'+34% damage'),(46,48,5,NULL,'+26% damage'),(47,48,13,NULL,'100% chance to proc root'),(48,54,16,NULL,'+23% damage'),(49,35,11,NULL,'Increases health gain by 50%'),(50,35,25,NULL,'+46% damage'),(51,70,6,NULL,'Reduced cooldown by 0.6 per charge'),(52,70,10,NULL,'Instant cast'),(53,70,35,NULL,'+16% heal'),(54,70,15,NULL,'+26% damage'),(55,47,32,NULL,'+43% damage'),(56,47,23,NULL,'+45% damage'),(57,33,12,NULL,'+101% damage'),(58,53,13,NULL,'+30% damage'),(59,9,4,NULL,'Heals 41% damage'),(60,9,22,NULL,'Adds 658-861 damage'),(61,57,28,NULL,'+11% damage'),(62,62,29,NULL,'+750% damage'),(63,62,8,NULL,'Adds Deathwish stacks * 108 damage'),(64,62,33,NULL,'Resets Stealth cooldown'),(65,6,29,NULL,'+40% crit chance'),(66,6,2,NULL,'+37% damage'),(67,55,4,NULL,'+30% damage'),(68,58,21,NULL,'+24% damage'),(69,7,7,NULL,'No stun at end of Rage'),(70,2,21,NULL,'+28% damage'),(71,15,5,NULL,'+2 sec fear duration'),(72,21,24,NULL,'+50% more heal'),(73,20,24,NULL,'+60% damage'),(74,24,24,NULL,'Double threat'),(75,24,26,NULL,'Better taunt!'),(76,19,10,NULL,'+68% damage'),(77,18,4,NULL,'+30% damage'),(78,18,10,NULL,'+61% damage'),(79,18,22,NULL,'+31% damage'),(80,40,25,NULL,'+23% damage'),(81,31,21,NULL,'Guanateed to steal 2 buffs'),(82,1,16,NULL,'+48% damage'),(83,17,32,NULL,'+46% damage'),(84,30,3,NULL,'Increases magic defense'),(85,3,4,NULL,'Extends BS by 30%'),(86,3,28,NULL,'+12% damage'),(87,12,5,NULL,'+1.5 sec fear duration'),(88,62,25,16,'+33% damage'),(89,55,14,16,'+77% damage'),(90,36,23,18,''),(91,19,25,16,'+42% damage'),(92,40,21,25,''),(93,1,22,16,''),(94,3,21,16,'');
UNLOCK TABLES;
DROP TABLE IF EXISTS `effect`;
CREATE TABLE `effect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
LOCK TABLES `effect` WRITE;
INSERT INTO `effect` VALUES (1,'Backflip'),(29,'Backstab'),(2,'Bleed'),(3,'Blockade'),(4,'Broken Spirit'),(30,'Buff Steal'),(5,'Burning'),(6,'Charge'),(34,'Cleanse'),(7,'Curse of Death'),(8,'Deathwish'),(9,'Disarm'),(31,'Dispel'),(10,'Energy Shield'),(11,'Exhausted'),(12,'Fear'),(35,'Flowing Life'),(13,'Frozen'),(14,'Hunter\'s Mark'),(15,'Impulse'),(16,'Knockdown'),(17,'Lighting'),(32,'Lightning'),(23,'Paralyze'),(18,'Poison'),(19,'Silence'),(20,'Sleep'),(21,'Slow'),(22,'Snare'),(33,'Stealth'),(24,'Strong will'),(25,'Stun'),(26,'Taunt'),(27,'Unbeatable'),(28,'Weak');
UNLOCK TABLES;
DROP TABLE IF EXISTS `spell`;
CREATE TABLE `spell` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=latin1;
LOCK TABLES `spell` WRITE;
INSERT INTO `spell` VALUES (1,9,'Triple Blow'),(2,9,'Rush'),(3,9,'Whirlwind'),(4,9,'Earthquake'),(5,9,'Pull Over'),(6,9,'Phantomblow'),(7,9,'Rage'),(8,9,'Bolt Of Heaven'),(9,3,'Mudhand'),(10,3,'Broken Spirit'),(11,3,'Bubble'),(12,3,'Whisper of Fear'),(13,3,'Cleanse'),(14,3,'Dizziness'),(15,3,'Scream of Fear'),(16,3,'Muscle Failure'),(17,3,'Tsunami'),(18,7,'Shieldstrike'),(19,7,'Shieldbash'),(20,7,'Scream Of Pain'),(21,7,'Scream Of life'),(22,7,'Blockade'),(23,7,'Hammer Of Wrath'),(24,7,'Scream Of Taunt'),(25,10,'Inhibition'),(26,10,'Energy Wave'),(27,10,'Energy Shield'),(28,10,'Energy Explosion'),(29,10,'Strong Will'),(30,10,'Unbeatable'),(31,10,'Theft'),(32,6,'Energy Arrow'),(33,6,'Mana Absorption'),(34,6,'Hell Spears'),(35,6,'Life Absorption'),(36,6,'Raven'),(37,6,'Grip Of Death'),(38,6,'Scream of Silence'),(39,6,'Curse of Death'),(40,1,'Shock Arrow'),(41,1,'Bleeding Arrow'),(42,1,'Ankle'),(43,1,'Hunter\'s Mark'),(44,1,'Arrow Bomb'),(45,8,'Fireball'),(46,8,'Iceball'),(47,8,'Lightningstrike'),(48,8,'Icefield'),(49,8,'Firerain'),(50,8,'Frozen Floor'),(51,8,'Chainlightning'),(52,8,'Firewall'),(53,8,'Meteor'),(54,5,'Instantaneous Impact'),(55,5,'Plunge'),(56,5,'Backflip'),(57,5,'Multistrike'),(58,5,'Quickshot'),(59,5,'Stealth'),(60,5,'Toxic Shot'),(61,5,'Hard Cut'),(62,5,'Perforation'),(63,2,'Chord'),(64,2,'Riff'),(65,2,'Anthem of the March'),(66,2,'Discord'),(67,2,'Anthem of Recovery'),(68,2,'Anthem of Protection'),(69,2,'Anthem of Power'),(70,4,'Light and Darkness'),(71,4,'Curse and Blessing'),(72,4,'Flowing Life'),(73,4,'Circle of Spears'),(74,4,'Groupheal'),(75,4,'Energycycle'),(76,4,'Continuous Recovery');
UNLOCK TABLES;
