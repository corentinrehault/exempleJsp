/*
#	Initiation à JSP
#	A. Tasso, S. Ermacore
#	Exemples Chapitre 5 : Interroger une base de données
#	Section : Enrichir une base de données avec JSP - Un composant JavaBean communique avec JSP
#	Fichier : DBLien.java
#	Class : DBLien
#	Package : Exemple.ch5
*/


package Exemples.Ch5 ;

import java.io.Serializable ;
import java.sql.*;

public class DBLien implements java.io.Serializable {
	
	//Définition des propriétés
	private Statement lien = null;
	
	// Méthodes d'accès en lecture
	public Statement getLien(Connection cnx) {
		if (construireStatement(cnx)) {
			return lien;
		} else {
			return null;
		}
	}
	
	// Méthodes invisibles
	private boolean construireStatement (Connection cnx) {
		boolean statusStatement = false;
		try {
			lien=cnx.createStatement();
			statusStatement = true ;
		} catch ( Exception e ) {
			statusStatement = false;
			System.out.println(e);
		}
		return statusStatement;	
	}
}
