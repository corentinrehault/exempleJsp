<!-- 
#	Initiation à JSP
#	A. Tasso, S. Ermacore
#	Exemples Chapitre 6 : Connaître l'internaute
#	Section : Traiter des objets Java au cours d'une session
#
# 	Fichier : pageAccueilSessionBean.jsp
# 	Description : Affiche les livres à réserver après avoir 
#                     créer une session à l'appel de la page verificationLecteur.jsp
# 	JavaBeans : DBConnexion, DBLien (exemplesJSP/WEB-INF/classes/exemple/Ch5)
#	Include : verificationLecteurBean.jsp
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
%> 
<html>
<body>
<table width=700><tr><td>
<h1><font face=arial>Liste des livres de la bibliothèque</h1>
<%@ include file="./verificationLecteurBean.jsp" %>

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

<%
  // Construction de la requete
  String liste="select * from livres";
  String chaineResultat=null;
  rs = lien.executeQuery(liste);
  chaineResultat=afficheListeLivres(rs, "black");
  out.println(chaineResultat);
%>
</td></tr></table>
</body>
</html>
