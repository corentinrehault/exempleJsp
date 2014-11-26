<!-- 
#	Initiation à JSP
#	A. Tasso, S. Ermacore
#	Exemples Chapitre 6 : Connaître l'internaute
#	Section : Exemple : Personnaliser la page d'accueil de la bibliothèque en ligne
#
# 	Fichier : pageAccueilCookie.jsp
# 	Description : Affiche la page d'accueil en fonction des préférences du 
#                     lecteur. Les préférences sont enregitrées dans un cookie.
# 	JavaBeans : DBConnexion, DBLien (exemplesJSP/WEB-INF/classes/exemple/Ch5)
-->

<%@ page import="java.sql.*" %>

<!--// Connexion à la base de donnée -->
<jsp:useBean id="dbcnx" class="Exemples.Ch5.DBConnexion">
<jsp:setProperty name="dbcnx" property="login" value="jspuser"/>
<jsp:setProperty name="dbcnx" property="password" value="jspuser"/>
<jsp:setProperty name="dbcnx" property="hostname" value="localhost"/>
<jsp:setProperty name="dbcnx" property="port" value="3306"/>
<jsp:setProperty name="dbcnx" property="nomDeLaBase" value="livrejsp"/>
</jsp:useBean>
<jsp:useBean id="dblien" class="Exemples.Ch5.DBLien"/>
<%
  Connection cnx = dbcnx.getCnx();
  if (cnx == null) {
    out.println("<font color=red>Erreur : " + cnx + "</font>");
  }
  Statement lien = dblien.getLien(cnx);
  if (lien == null) {
    out.println("<font color=red>Erreur : " + lien + "</font>");
  } 
  // Gestion des cookies
  Cookie cookieNom = null;
  Cookie cookiePrenom = null;
  Cookie cookieCategorie = null;
  Cookie cookiecouleurFond = null;
  Cookie cookiecouleurTxt = null;
  String nom = "";
  String prenom = "";
  String categorie = "";
  String couleurFond = "white";
  String couleurTxt = "black";

  // Lecture de tous les cookies stockés sur l'ordinateur du lecteur
  Cookie tousLesCookies [] = request.getCookies();

  // Tester si l'utilisateur vient de la page formulaire
  if (request.getParameter("nom") != null) {
      // Enregistrer les valeurs provenant du formulaire dans les cookies    
      nom = request.getParameter("nom");
      cookieNom = new Cookie("nom", nom);
      response.addCookie(cookieNom);
      prenom = request.getParameter("prenom");
      cookiePrenom = new Cookie("prenom", prenom);
      response.addCookie(cookiePrenom);
      categorie = request.getParameter("categorie");
      cookieCategorie = new Cookie("categorie", categorie);
      response.addCookie(cookieCategorie);
      couleurFond = request.getParameter("couleurFond");
      cookiecouleurFond = new Cookie("couleurFond", couleurFond);
      response.addCookie(cookiecouleurFond);
      couleurTxt = request.getParameter("couleurTxt");
      cookiecouleurTxt = new Cookie("couleurTxt", couleurTxt);
      response.addCookie(cookiecouleurTxt);          
  } 
  // Si les cookies existent, récupérer les valeurs associées.
  else if (tousLesCookies != null) {
      for (int i = 0 ; i<tousLesCookies.length ; i++) {
        if (tousLesCookies[i].getName().equals("nom")) {
          cookieNom = tousLesCookies[i];
          nom = cookieNom.getValue();
        } else if(tousLesCookies[i].getName().equals("prenom")) {
          cookiePrenom = tousLesCookies[i];
          prenom = cookiePrenom.getValue();      
        } else if(tousLesCookies[i].getName().equals("categorie")) {
          cookieCategorie = tousLesCookies[i];
          categorie = cookieCategorie.getValue();      
        } else if(tousLesCookies[i].getName().equals("couleurFond")) {
          cookiecouleurFond = tousLesCookies[i];
          couleurFond = cookiecouleurFond.getValue();      
        } else if(tousLesCookies[i].getName().equals("couleurTxt")) {
          cookiecouleurTxt = tousLesCookies[i];
          couleurTxt = cookiecouleurTxt.getValue();      
        } else {
         // Si les cookies n'existent pas, prendre des valeurs par défaut.
            nom = "Madame, Monsieur";
            prenom = "";
            categorie = "";
            couleurFond = "white";
            couleurTxt = "black";          
        }
      }
  } 
%>
<%!
  // Fonction d'affichage des livres selon la requête transmise
  public String afficheListeLivres(ResultSet rs, String police) {
    String chaine="";
    if (rs == null) {
      chaine="<font color=red>Pas de résultat : "+rs+"</font>";
    } else {
      try {
        chaine="<table width=700 border=1>";
        chaine=chaine+"<tr>";
        chaine=chaine+"  <td><font face=arial size=2 color=red>CodeLivre </td>";
        chaine=chaine+"  <td><font face=arial size=2 color=red>NomAuteur </td>";
        chaine=chaine+"  <td><font face=arial size=2 color=red>PrenomAuteur </td> ";
        chaine=chaine+"  <td><font face=arial size=2 color=red>Titre</td>";
        chaine=chaine+"  <td><font face=arial size=2 color=red>Categorie </td>";
        chaine=chaine+"  <td><font face=arial size=2 color=red>ISBN</td>";
        chaine=chaine+"</tr>";
        while (rs.next()) {
          chaine=chaine+"<tr>";
          chaine=chaine+"  <td><font face=arial size=2 color=" + police + ">" + rs.getString("LIV_CodeLivre") + "</td>";
          chaine=chaine+"  <td><font face=arial size=2 color=" + police + ">" + rs.getString("LIV_NomAuteur") + "</td>";
          chaine=chaine+"  <td><font face=arial size=2 color=" + police + ">" + rs.getString("LIV_PrenomAuteur") + "</td>";
          chaine=chaine+"  <td><font face=arial size=2 color=" + police + ">" + rs.getString("LIV_Titre") + "</td>";
          chaine=chaine+"  <td><font face=arial size=2 color=" + police + ">" + rs.getString("LIV_Categorie") + "</td>";
          chaine=chaine+"  <td><font face=arial size=2 color=" + police + ">" + rs.getString("LIV_ISBN") + "</td>";
          chaine=chaine+"</tr>";
  	}
        chaine=chaine+"</table>";
      } catch (Exception e) {
        chaine = e.getMessage();
      }
    }
  return chaine;
  } 
%>

<!--// Afficher la page en fonction des préférences -->
<html>
<body bgcolor=<%=couleurFond%>>
<table width=700><tr><td>
<h1><font face=arial color="<%=couleurTxt%>">Bonjour <%=prenom%> <%=nom%></h1><a href="saisiePreferencesLecteur.jsp">Vos préférences</a>

<h3><font face=arial color="<%=couleurTxt%>">Les livres correspondant à votre catégorie préférée : <%=categorie%></h3>
<%
  // Construction de la requete pour la catégorie préférée
  String livresPerso="select * from livres where LIV_Categorie='" + categorie+ "'";
  String chaineResultat;
  ResultSet rs;
  rs = lien.executeQuery(livresPerso);
  chaineResultat=afficheListeLivres(rs, couleurTxt);
  out.println(chaineResultat);
%>
<h3><font face=arial color="<%=couleurTxt%>">Les autres livres</h3>
<%
  // Construction de la requete pour les autres livres
  String livres="select * from livres where LIV_Categorie<>'" + categorie +"'";
  rs = lien.executeQuery(livres);
  chaineResultat=afficheListeLivres(rs, couleurTxt);
  out.println(chaineResultat);
%>
</td></tr></table>
</body>
</html>