/*
#	Initiation � JSP
#	A. Tasso, S. Ermacore
#	Exemples Chapitre 6 : Conna�tre l'internaute
#	Section : Traiter des objets Java au cours d'une session
#	Fichier : Lecteur.java
#	Class : Lecteur
#	Package : Exemple.ch6
*/

package Exemples.Ch6 ;

import java.io.Serializable ;
import java.util.Calendar ;
import java.text.DateFormat ;
public class Lecteur implements java.io.Serializable {

	//D�finition des propri�t�s
	private String nomLecteur ;
	private String prenomLecteur ;
	private String numero ;
        private String motDePasse ;		
	private String adresse ;	
  	private String codePostal ;		
 	private String ville ;	  
	private String dateAnniversaire ;

	// D�finition des methodes d�acc�s en �criture
	// Enregistre le nom du lecteur
	public void setNomLecteur (String valeur) {
		nomLecteur =valeur;
	}
	// Enregistre le pr�nom de l'auteur 
	public void setPrenomLecteur (String valeur) {
		prenomLecteur =valeur;
	}
	// Enregistre le numero de l'auteur 
	public void setNumero (String valeur) {
		numero = valeur;
	}
	// Enregistre le nom de la rue 
	public void setAdresse (String valeur) {
	  adresse = valeur;
	}
	// Enregistre le code postal 
	public void setCodePostal (String valeur) {
          codePostal = valeur;
        }
        // Enregistre le nom de la ville 
        public void setVille (String valeur) {
           ville = valeur;
	}
        // Enregistre le mot de passe
        public void setMotDePasse (String valeur) {
           motDePasse = valeur;
	}	
		
	// D�finition des methodes d�acc�s en lecture
	// Consulte le nom du lecteur
	public String getNomLecteur () {
		return nomLecteur;
	}
	// Consulte le pr�nom de l'auteur 
	public String getPrenomLecteur () {
		return prenomLecteur;
	}
	// Consulte le numero de l'auteur 
	public String getNumero () {
		return numero;
	}
	// Consulte le nom de la rue 
	public String getAdresse () {
	  return adresse;
	}
	// Consulte le code postal 
	public String getCodePostal () {
    	  return codePostal;
  	}
 	// Consulte le nom de la ville  	
  	public String getVille () {
    	  return ville;
	}
	// Consulte le mot de passe
  	public String getMotDePasse () {
          return motDePasse;
	}	

	// M�thode m�tier , calcule le code d'enregistrement
	public String getDateAnniversaire() {
		Calendar dans1An;
		dans1An = calculDateAnniversaire();
		dateAnniversaire= DateFormat.getDateInstance().format(dans1An.getTime());
		return dateAnniversaire; 
	}

	// M�thode m�tier, calcule la date d'anniversaire
	private Calendar calculDateAnniversaire () {
		Calendar dans1an=Calendar.getInstance();
		dans1an.add(dans1an.YEAR,1);
		return dans1an;

	}
}

