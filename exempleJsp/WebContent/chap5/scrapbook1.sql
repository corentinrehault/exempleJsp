CREATE USER 'userjsp'@'localhost' IDENTIFIED BY 'userjsp';
GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP ON livrejsp.* TO 'userjsp'@'localhost';

CREATE TABLE livres (LIV_CodeLivre char(255) DEFAULT '' NOT NULL, LIV_NomAuteur char(255), LIV_PrenomAuteur char(255), LIV_Titre char(255), LIV_Categorie char(255), LIV_ISBN char(255), LIV_DejaReserve tinyint(1) DEFAULT 0 NOT NULL, PRIMARY KEY (LIV_CodeLivre));
CREATE TABLE lecteurs (LEC_NumLecteur char(16) DEFAULT '' NOT NULL, LEC_NomLecteur char(16), LEC_PrenomLecteur char(16), LEC_Adresse char(80), LEC_Ville char(16), LEC_CodePostal char(10), LEC_MotDePasse char(80), PRIMARY KEY (LEC_NumLecteur));
CREATE TABLE emprunts (EMP_Numero char(255) DEFAULT '' NOT NULL, EMP_Date date, EMP_DateRetour date, EMP_CodeLivre char(255), EMP_NumLecteur char(255), PRIMARY KEY (EMP_Numero));
CREATE TABLE Livre (Code varchar(255) NOT NULL, Titre varchar(255), Categorie varchar(255), Isbn varchar(255), NomAuteur varchar(255), PrenomAuteur varchar(255), PRIMARY KEY (Code));
CREATE TABLE Lecteur (Numero varchar(255) NOT NULL, NomLecteur varchar(255), PrenomLecteur varchar(255), Adresse varchar(255), Ville varchar(255), CodePostal varchar(255), DateAnniversaire varchar(255), MotDePasse varchar(255), PRIMARY KEY (Numero));
CREATE TABLE Emprunt (NumeroEmprunt varchar(255) NOT NULL, DateEmprunt varchar(255), DateRetourEmprunt varchar(255), CodeLivre varchar(255), NumeroLecteur varchar(255), PRIMARY KEY (NumeroEmprunt));

