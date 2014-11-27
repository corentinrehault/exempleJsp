/*
#	Initiation à JSP
#	A. Tasso, S. Ermacore
#	Exemples Chapitre 5 : Interroger une base de données
#	Section : Enrichir une base de données avec JSP - Un composant JavaBean communique avec JSP
#	Fichier : Livre.java
#	Class : Livre
#	Package : Exemple.ch5
*/

package Exemples.Ch5 ;

import java.io.Serializable ;
public class Livre implements java.io.Serializable {

	//Définition des propriétés
	private String titre;
	private String categorie ;
	private String isbn ;
	private String nomAuteur ;
	private String prenomAuteur ;
	private String code ;

	// Définition des méthodes d'accès en écriture
	// Enregistre le Titre
	public void setTitre (String valeur) {
		titre = valeur ;
	}
	// Enregistre la catégorie
	public void setCategorie (String valeur) {
		categorie = valeur;
	}
	// Enregistre le numéro ISBN
	public void setIsbn (String valeur) {
		isbn =valeur;
	}
	// Enregistre le nom de l'auteur 
	public void setNomAuteur (String valeur) {
		nomAuteur =valeur;
	}
	// Enregistre le prénom de l'auteur 
	public void setPrenomAuteur (String valeur) {
		prenomAuteur =valeur;
	}
	
	// Définition des méthodes d'accès en lecture
	// Consulte le titre
	public String getTitre () {
		return titre;
	}
	// Consulte la catégorie
	public String getCategorie () {
		return categorie;
	}
	// Consulte le numéro ISBN
	public String getIsbn () {
		return isbn;
	}
	// Consulte le nom de l'auteur 
	public String getNomAuteur () {
		return nomAuteur;
	}
	// Consulte le prénom de l'auteur 
	public String getPrenomAuteur () {
		return prenomAuteur;
	}
	// Consulte le code d'enregistrement
	public String getCode() {
		code= calculCode ();
		return code;
	}

	// Méthode métier : Calculer le code d'enregistrement
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
