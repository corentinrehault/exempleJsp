# Host: localhost
# Generation Time: Jun 24, 2004 at 10:20 AM
# Server version: 4.0.20
# 
#	Initiation à JSP
#	A. Tasso, S. Ermacore
#	Exemples Chapitre 5 : Connaître l'internaute
#	Section : Mise en place d'une base de données
# 	Database : `livrejsp` pour les exemples du chapitre 6
# 	Remarque : Pour mettre à jour la table lancer mysql depuis une fenêtre de commande
#                  avec la commande mysql -u root -p (taper le mot de passe root)
#                  ensuite sous mysql taper la commande source /chemin d'acces/au/fichier/livrejsp.sql;
#                  Pour les exemples du chapitre 6, la table lecteurs  contient  
#                  un champs mot de passe, la table livres ne contient pas de champs dejaReserve 
# 

USE mysql;
DROP DATABASE IF EXISTS `livrejsp`;
CREATE DATABASE `livrejsp`;
USE livrejsp;
# --------------------------------------------------------

#
# Structure de la table `lecteurs` pour les exemples du chapitre 6
#

DROP TABLE IF EXISTS `emprunts`;
CREATE TABLE `emprunts` (
  EMP_Numero char(255),
  EMP_Date date ,
  EMP_DateRetour date,
  EMP_CodeLivre char(255) ,
  EMP_NumLecteur char(255),
  PRIMARY KEY  (`EMP_Numero`)
) ;

# --------------------------------------------------------

#
# Structure de la table `lecteurs` pour les exemples du chapitre 6
#

DROP TABLE IF EXISTS `lecteurs`;
CREATE TABLE `lecteurs` (
  LEC_NumLecteur char(16),
  LEC_NomLecteur char(16),
  LEC_PrenomLecteur char(16),
  LEC_Adresse char(80),
  LEC_Ville char(16),
  LEC_CodePostal char(10),
  LEC_MotDePasse char(80),
  PRIMARY KEY  (`LEC_NumLecteur`)
);

# Données enregistrées pour la table `lecteurs` pour les exercices emples du chapitre 6

INSERT INTO `lecteurs` VALUES ('216', 'Lamy', 'Eléna', '7 rue du Paradis', 'Paris', '75012', 'Eléna');
INSERT INTO `lecteurs` VALUES ('221', 'Théos', 'Pablo', '3 passage Secret', 'Paris', '75004', 'Pablo');
INSERT INTO `lecteurs` VALUES ('342', 'Camden',	'Nicolas', '24 av du Papillon', 'Paris', '75013', 'Nicolas');
INSERT INTO `lecteurs` VALUES ('528', 'Line', 'Margo', '22 rue de la Liberté', 'Paris', '75005', 'Margo');


# --------------------------------------------------------

#
# Structure de la table `livres` pour les exemples du chapitre 6
#

DROP TABLE IF EXISTS `livres`;
CREATE TABLE `livres` (
  LIV_CodeLivre char(255) ,
  LIV_NomAuteur char(255) ,
  LIV_PrenomAuteur char(255) ,
  LIV_Titre char(255) ,
  LIV_Categorie char(255) ,
  LIV_ISBN char(255) ,
  PRIMARY KEY  (`LIV_CodeLivre`)
);

#
# Données enregistrées pour la table `livres` pour les exemples du chapitre 6
#

INSERT INTO `livres` VALUES ('KaElRo58', 'Kazan', 'Elia', 'L\'arrangement', 'Roman', '2234023858');
INSERT INTO `livres` VALUES ('GaJoPh68', 'Gaarder', 'Jostein', 'Le monde de Sophie', 'Philosophie', '2020550768');
INSERT INTO `livres` VALUES ('AsIsSc08', 'Asimov', 'Isaac', 'Fondation', 'Science-fiction', '2070415708');
INSERT INTO `livres` VALUES ('FaPhSc90', 'Farmer', 'Philip José', 'Le monde du Fleuve', 'Science-fiction', '2253061190');
INSERT INTO `livres` VALUES ('DiPhSc43', 'Dick', 'Philip K.', 'Blade Runner', 'Science-fiction', '2290314943');
INSERT INTO `livres` VALUES ('CoAnPh07', 'Comte-Sponville', 'André', 'Traité du désespoir et de la béatitude', 'Philosophie', '2130529607');
INSERT INTO `livres` VALUES ('WaAlRo37', 'Walker', 'Alice', 'La couleur pourpre', 'Roman', '2290021237');
INSERT INTO `livres` VALUES ('LeGaPo95', 'Leroux', 'Gaston', 'Le mystère de la chambre jaune', 'Policier', '2253005495');
INSERT INTO `livres` VALUES ('KeDoPo83', 'Kennedy', 'Douglas', 'L\'homme qui voulait vivre sa vie', 'Policier', '2266087983');
INSERT INTO `livres` VALUES ('KuMiRo38', 'Kundera', 'Milan', 'La plaisanterie', 'Roman', '2070703738');
INSERT INTO `livres` VALUES ('ZwStRo33', 'Zweig', 'Stefan', 'La confusion des sentiments', 'Roman', '2253061433');
INSERT INTO `livres` VALUES ('BaJaJu63', 'Barrie', 'James M.', 'Peter Pan', 'Junior', '2290333263');
INSERT INTO `livres` VALUES ('VeJuRo22', 'Verne', 'Jules', 'L\'île mystérieuse', 'Roman', '0812966422');
    
