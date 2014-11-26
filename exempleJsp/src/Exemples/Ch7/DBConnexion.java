/*
#	Initiation � JSP
#	A. Tasso, S. Ermacore
#	Exemples Chapitre 7 : Les servlets ou les dessous cach�s de JSP
#	Section : Construire ses propres servlets 
#                 - Une servlet pour authentifier un lecteur aupr�s d'une base de donn�es
#	Fichier : DBConnexion.java
#	Class : DBConnection
*/

import java.sql.*;

public class DBConnexion {
	
	//D�finition des propri�t�s
	private String login;
	private String password ;
	private String hostname;
	private String port;
	private String nomDeLaBase;
	private Connection cnx;
	
	// Methodes d'acces en �criture
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
	
	// M�thodes invisibles (m�tier)
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
