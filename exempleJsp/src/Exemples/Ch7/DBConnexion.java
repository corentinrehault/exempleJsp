/*
#	Initiation à JSP
#	A. Tasso, S. Ermacore
#	Exemples Chapitre 7 : Les servlets ou les dessous cachés de JSP
#	Section : Construire ses propres servlets 
#                 - Une servlet pour authentifier un lecteur auprès d'une base de données
#	Fichier : DBConnexion.java
#	Class : DBConnection
*/

import java.sql.*;

public class DBConnexion {
	
	//Définition des propriétés
	private String login;
	private String password ;
	private String hostname;
	private String port;
	private String nomDeLaBase;
	private Connection cnx;
	
	// Methodes d'acces en écriture
	public void setLogin (String valeur) {
		login = valeur ;
	}
	
	public void setPassword (String valeur) {
		password = valeur ;
	}
	
	public void setHostname (String valeur) {
		hostname = valeur ;
	}
		
	public void setPort (String valeur) {
		port = valeur ;
	}
	
	public void setNomDeLaBase (String valeur) {
		nomDeLaBase = valeur ;
	}	
	
	// Methodes d'acces en lecture
	public Connection getCnx() {
		if (etablirConnexion()) {
			return cnx;	
		} else {
			return null;
		}
	}	
	
	// Méthodes invisibles (métier)
	private String construireUrlJdbc() {
		String urlJdbc ;
		urlJdbc = "jdbc:mysql://"+hostname+":" + port + "/" + nomDeLaBase ;
		urlJdbc = urlJdbc + "?user=" + login + "&password=" + password ;
		return urlJdbc ;
	}
	
	private boolean etablirConnexion() {
		boolean statusConnexion = false;
		String urlJdbc ;
		try { 
			Class.forName("com.mysql.jdbc.Driver");
			urlJdbc=construireUrlJdbc();
			cnx=DriverManager.getConnection(urlJdbc);
			statusConnexion = true;
		} catch ( Exception e ) {
			statusConnexion = false;
			System.out.println(e);
		}
		return statusConnexion;
	}
	
}
