/*
#	Initiation à JSP
#	A. Tasso, S. Ermacore
#	Exemples Chapitre 4 : Utiliser un objet Java dans un script
#	Section : Ecrire un JavaBean - Exemple : calculer le coût d'une voiture
#	Fichier : CoutDeRevient.java
#	Class : CoutDeRevient
#	Package : Exemple.ch4
*/
package Exemples.Ch4 ;

import java.io.Serializable ;
public class CoutDeRevient implements java.io.Serializable {

	//Définition des propriétés
	private float coutRoue;
	private float coutCarrosserie ;
	private float coutMoteur ;
	private float coutVolant ;
	private float coutRevient ;

	// Définition des méthodes d'accès en écriture
	// La roue
	public void setCoutRoue (float valeur) {
		coutRoue = valeur ;
	}
	// La carrosserie
	public void setCoutCarrosserie (float valeur) {
		coutCarrosserie = valeur;
	}
	// Le moteur
	public void setCoutMoteur (float valeur) {
		coutMoteur =valeur;
	}
	// Le volant 
	public void setCoutVolant (float valeur) {
		coutVolant =valeur;
	}
	// Définition des méthodes d'accès en lecture
	// Le coût total de revient
	public float getCoutRevient() {
		coutRevient= calculCoutRevient ();
		return coutRevient;
	}

	// Définition des méthodes "métier" 
	// Vérifier la validité des données	
	private boolean verifCout () {
		if (coutRoue<0 || coutMoteur<0 || coutCarrosserie < 0 || coutVolant < 0 ) {
			return false ;
		} else {
			return true ;
		} 
	}
	// Calculer le coût de revient 
	private float calculCoutRevient () {
		if (verifCout()) {
			return coutRoue*4+coutMoteur+coutCarrosserie+coutVolant;
		} else {
			return -1f ;
		}
	}
}
