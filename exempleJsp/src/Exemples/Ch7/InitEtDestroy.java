/*
#	Initiation à JSP
#	A. Tasso, S. Ermacore
#	Exemples Chapitre 7 : Les servlets ou les dessous cachés de JSP
#	Section : Construire ses propres servlets 
#                 - Une servlet pour authentifier un lecteur auprès d'une base de données
#	Fichier : InitEtDestroy.java
#	Class : InitEtDestroy
*/
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class InitEtDestroy extends HttpServlet  {
  private Statement lien; 
  private Connection cnx; 

// init() est appelée avant le traitement des requêtes 
public void init(ServletConfig config) throws ServletException  {
  super.init(config);
  String fichier  = config.getInitParameter("nomFichier"); 

  try    {
    // Recherche le parametre nomFichier défini dans /WEB-INF/web.xml
    String mot="";
    int i = 1;
    // Si le fichier contenant les parametres a été trouvé  
    if (fichier != null) {  
      // Création d'un objet DBConnexion
      DBConnexion dbcnx = new DBConnexion();  
      // Lire  le fichier d'initialisation  ligne par ligne  
      BufferedReader br = new BufferedReader(new FileReader(fichier));         
      while ((mot = br.readLine()) != null) {   
      //  System.out.println("mot :"+  mot +"<BR>");    
        switch(i) {
          // La première ligne définie le nom d'utilisateur de la base de données
          case 1 : // mot = "jspuser"
            dbcnx.setLogin(mot);
            break;
          // La deuxième ligne définie le mot de passe de l'utilisateur 
          case 2 : // mot = "jspuser"
            dbcnx.setPassword(mot);
            break;
          // La troisième ligne définie le nom de la machine
          case 3 : // mot = "localhost"
            dbcnx.setHostname(mot);
            break;
          // La quatrieme ligne définie le numéro du port
          case 4 : // mot = "3306"   
            dbcnx.setPort(mot);
            break;
          // La cinquième ligne définie le nom de la base de données
          case 5 : // mot = "livrejsp"   
            dbcnx.setNomDeLaBase(mot);
            break;    	      
        } 
        i++;   
      }     
      // Création d'un objet DBLien
      DBLien dblien = new DBLien();
      // Ouvrir une connection sur la base de données
      cnx = dbcnx.getCnx();
      if (cnx == null) {
        System.out.println("Erreur de connexion avec la base de données");
      }
      lien = dblien.getLien(cnx);
      if (lien == null) {
        System.out.println("Erreur de liaison avec la base de données");
      }
    } else {          
       System.out.println("Le fichier d'initialisation n'existe pas"); 
    } 
 }
  catch(Exception e)   {
     System.out.println(e);
  }
        
  
}

// doGet() est appelée lorsque la requête est passée en mode GET
public void doGet( HttpServletRequest req, HttpServletResponse rep)throws IOException, ServletException {

   rep.setContentType("text/html");
   PrintWriter pw = rep.getWriter();
   pw.println("<html>");
   pw.println("<head>");
   pw.println("<title> Servlet Login avec Get </title>");
   pw.println("</head>");
   pw.println("<body bgcolor='white'>");
   pw.println("<h2><font face=arial>Formulaire d'identification</h2>");
   pw.println("<form name=ident action=http://localhost:8080/exemplesJSP/servlet/ServletParametree method=POST>");
   pw.println("<table>");
   pw.println("<tr>");
   pw.println("<td><font face=arial size=2>Nom : </td>");
   pw.println("<td><input type=text name=nomLecteur></td>");
   pw.println("</tr><tr>");
   pw.println("<td><font face=arial size=2>Mot de passe : </td>");
   pw.println("<td><input type=password name=motDePasse></td>");
   pw.println("</tr>");
   pw.println("</table>");
   pw.println("<input type=submit value=Login>");
   pw.println("</form>");
   pw.println("</body>");
   pw.println("</html>");
 }  
 
// doPost() est appelée lorsque la requête est passée en mode POST
public void doPost(HttpServletRequest req, HttpServletResponse rep) throws ServletException, IOException  {
  PrintWriter pw = rep.getWriter();
  rep.setContentType("text/html");
  pw.println("<html>");
  pw.println("<head>");
  pw.println("<title> Initialisation d'une servlet </title>");
  pw.println("</head>");
  pw.println("<body bgcolor='white'>");
  HttpSession session = req.getSession();

  String nomLecteur= req.getParameter("nomLecteur");
  String motDePasse = req.getParameter("motDePasse");
  String nomBD ="select * from lecteurs where LEC_NomLecteur='"+nomLecteur+"' and LEC_MotDePasse='"+motDePasse+"'";
  ResultSet rs;
  try     {
    rs = lien.executeQuery(nomBD);
    // Si le lecteur existe dans la base de donnée
    if (rs.first()) {
     // enregistrer toutes les informations dans l'objet session 
       session.setAttribute("numeroLecteur", rs.getString("LEC_NumLecteur"));
       session.setAttribute("nomLecteur", rs.getString("LEC_NomLecteur"));
       session.setAttribute("prenomLecteur", rs.getString("LEC_prenomLecteur"));
       session.setAttribute("adresseLecteur", rs.getString("LEC_Adresse"));
       session.setAttribute("codePostalLecteur",rs.getString("LEC_CodePostal"));
       session.setAttribute("villeLecteur", rs.getString("LEC_Ville"));
       session.setAttribute("motDePasseLecteur",rs.getString("LEC_MotDePasse"));
     }  
     else {
       session.setAttribute("nomLecteur", null);
       // Si le lecteur ou le mot de passe n'est  pas correct
       pw.println ("<br><font face=arial color=black><b>Lecteur ou mot de passe inconnu <br></b></font>");  
     }    
  } catch ( Exception e ) {
     pw.println ("<br><font face=arial color=black><b>Erreur : <br></b></font>" + e.getMessage());  
  }
  // Vérifier si le nom du lecteur est enregistré dans la session
  nomLecteur=(String)session.getAttribute("nomLecteur");
  // Si le lecteur est enregistré dans la session
  if (nomLecteur!=null) {
    // Afficher le nom et prénom du lecteur 
    String prenomLecteur = (String) session.getAttribute("prenomLecteur");
    pw.println ("<h1><font face=arial >Bonjour "+prenomLecteur + " " +nomLecteur+ "<br></h1>"); 
    // Afficher le lien " Modifier vos preferences … " 
    pw.println ("<br>");
    pw.println ("<font face=arial size=2>Vous pouvez modifier vos préférences ");
    pw.println ("<a href=http://localhost:8080/exemplesJSP/chap6/saisiePreferencesLecteur.jsp>ici</a>");

    pw.println ("<br><br>");
   // Si le lecteur n'est pas enregistré dans la session
  } else {
    pw.println("Vous n'êtes pas enregistré sur la bibliothèque en ligne"); 
  }
  pw.println("</body>");
  pw.println("</html>");
  pw.close();
 }
// destroy() est appelée lorsque le serveur est arrêté proprement (shutdown)
public void destroy() {
  try {
   cnx.close();
  }
  catch(Exception e)  {
    System.out.println(e);
  }
}
} 