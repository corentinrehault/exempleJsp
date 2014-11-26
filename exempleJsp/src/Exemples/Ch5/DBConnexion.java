/*
#	Initiation � JSP
#	A. Tasso, S. Ermacore
#	Exemples Chapitre 5 : Interroger une base de donn�es
#	Section : Enrichir une base de donn�es avec JSP - Un composant JavaBean communique avec JSP
#	Fichier : DBConnexion.java
#	Class : DBConnection
#	Package : Exemple.ch5
*/

package Exemples.Ch5 ;
import java.io.Serializable ;
import java.sql.*;
 
public class DBConnexion implements java.io.Serializable {
	
	//D�finition des propri�t�s
	private String login;
	private String password ;
	private String hostname;
	private String port;
	private String nomDeLaBase;
	private Connection cnx;
	
	// Methodes d'acces en �criture
	// Enregistre le nom de login
	public void setLogin (String valeur) {
		login = valeur ;
	}
	// Enregistre le mot de passe	
	public void setPassword (String valeur) {
		password = valeur ;
	}
	// Enregistre le nom du Host	
	public void setHostname (String valeur) {
		hostname = valeur ;
	}
	// Enregistre le num�ro de port		
	public void setPort (String valeur) {
		port = valeur ;
	}
	// Enregistre le nom de la base de donn�es	
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
	// Construit l'URL
	private String construireUrlJdbc() {
		String urlJdbc ;
		urlJdbc = "jdbc:mysql://"+hostname+":" + port + "/" + nomDeLaBase ;
		urlJdbc = urlJdbc + "?user=" + login + "&password=" + password ;
		return urlJdbc ;
	}
	// Etablit la connexion	
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
