/*
#	Initiation � JSP
#	A. Tasso, S. Ermacore
#	Exemples Chapitre 5 : Interroger une base de donn�es
#	Section : Enrichir une base de donn�es avec JSP - Un composant JavaBean communique avec JSP
#	Fichier : Livre.java
#	Class : Livre
#	Package : Exemple.ch5
*/

package Exemples.Ch5 ;

import java.io.Serializable ;
public class Livre implements java.io.Serializable {

	//D�finition des propri�t�s
	private String titre;
	private String categorie ;
	private String isbn ;
	private String nomAuteur ;
	private String prenomAuteur ;
	private String code ;

	// D�finition des methodes d�acc�s en �criture
	// Enregistre le Titre
	public void setTitre (String valeur) {
		titre = valeur ;
	}
	// Enregistre la cat�gorie
	public void setCategorie (String valeur) {
		categorie = valeur;
	}
	// Enregistre le num�ro ISBN
	public void setIsbn (String valeur) {
		isbn =valeur;
	}
	// Enregistre le nom de l'auteur 
	public void setNomAuteur (String valeur) {
		nomAuteur =valeur;
	}
	// Enregistre le pr�nom de l'auteur 
	public void setPrenomAuteur (String valeur) {
		prenomAuteur =valeur;
	}
	
	// D�finition des methodes d�acc�s en lecture
	// Consulte le titre
	public String getTitre () {
		return titre;
	}
	// Consulte la cat�gorie
	public String getCategorie () {
		return categorie;
	}
	// Consulte le num�ro ISBN
	public String getIsbn () {
		return isbn;
	}
	// Consulte le nom de l'auteur 
	public String getNomAuteur () {
		return nomAuteur;
	}
	// Consulte le pr�nom de l'auteur 
	public String getPrenomAuteur () {
		return prenomAuteur;
	}
	// Consulte le code d'enregistrement
	public String getCode() {
		code= calculCode ();
		return code;
	}

	// M�thode m�tier : Calculer le code d'enregistrement
	private String calculCode () {
		String debutNom;
		String debutPrenom;
		String debutCategorie;
		int longueurIsbn;
		String finIsbn;

		debutNom=nomAuteur.substring(0,2);
		debutPrenom=prenomAuteur.substring(0,2);
		debutCategorie=categorie.substring(0,2);
		longueurIsbn=isbn.length();
		finIsbn=isbn.substring((longueurIsbn-2),longueurIsbn);
		return debutNom+debutPrenom+debutCategorie+finIsbn;

	}
}
