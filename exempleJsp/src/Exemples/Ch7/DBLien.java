/*
#	Initiation à JSP
#	A. Tasso, S. Ermacore
#	Exemples Chapitre 7 : Les servlets ou les dessous cachés de JSP
#	Section : Construire ses propres servlets 
#                 - Une servlet pour authentifier un lecteur auprès d'une base de données
#	Fichier : DBLien.java
#	Class : DBLien
*/
import java.sql.*;

public class DBLien {
	
	//Définition des propriétés
	private Statement lien = null;
	
	// Methodes d'acces en lecture
	public Statement getLien(Connection cnx) {
		if (construireStatement(cnx)) {
			return lien;
		} else {
			return null;
		}
	}
	
	// Methodes invisibles
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
