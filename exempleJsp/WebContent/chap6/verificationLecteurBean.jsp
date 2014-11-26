<!-- 
#	Initiation � JSP
#	A. Tasso, S. Ermacore
#	Exemples Chapitre 6 : Conna�tre l'internaute
#	Section : Personnaliser la page d'accueil de la biblioth�que en ligne
#
# 	Fichier : verificationLecteurBean.jsp
# 	Description : g�re la session du lecteur
# 	JavaBeans : Lecteur.java  (exemplesJSP/WEB-INF/classes/exemple/Ch6)
-->

<jsp:useBean id="lecteur" class="Exemples.Ch6.Lecteur" scope="session"/>

<%
  // Le lecteur s'est identifi�, 
  // R�cup�rer les param�tres d'identification
  String nomLecteur = request.getParameter("nomLecteur");
  String motDePasse = request.getParameter("motDePasse");
  // Rechercher un lecteur portant le nom et ayant le m�me mot de passe 
  // que ceux pass�s en param�tre 
  String nomBD ="select * from lecteurs where LEC_NomLecteur='"+nomLecteur+"' and LEC_MotDePasse='"+motDePasse+"'";
  ResultSet rs;
  rs = lien.executeQuery(nomBD);  
  // Si le lecteur existe dans la base de donn�e
  if (rs.first()) {
      // enregistrer toutes les informations dans l'objet lecteur 
    lecteur.setNumero(rs.getString("LEC_NumLecteur"));
    lecteur.setNomLecteur(rs.getString("LEC_NomLecteur"));
    lecteur.setPrenomLecteur(rs.getString("LEC_PrenomLecteur"));
    lecteur.setAdresse(rs.getString("LEC_Adresse"));
    lecteur.setCodePostal(rs.getString("LEC_CodePostal"));
    lecteur.setVille(rs.getString("LEC_Ville"));
    lecteur.setMotDePasse(rs.getString("LEC_MotDePasse"));
  }  
  else {
  lecteur.setNomLecteur(null);
     // Si le lecteur ou le mot de passe n'est  pas correct
     out.println ("<br><font face=arial color=black><b>Lecteur ou mot de passe inconnu <br></b></font>");  
  }

  // On modifie l'affichage en fonction de la valeur du booleen.
  if (lecteur.getNomLecteur() != null) {
%>
<font face=arial size=2>Bonjour <b><%=lecteur.getNomLecteur()%> <%=lecteur.getPrenomLecteur()%> !</b><br>
<font face=arial size=2>Vous pouvez emprunter des livres <a href=\"\">ici</a>
<%
  } else {
%>
  <!--// Afficher le formulaire invitant le lecteur � s'identifier -->
    <font face=arial size=2> Vous n'�tes pas identifi�.<br>
     Vous devez vous identifier pour pouvoir emprunter des livres en ligne<br>
    <h2><font face=arial>Formulaire d'identification</h2>
    <form name=ident action="./pageAccueilSessionBean.jsp" method=POST>
    <table>
    <tr>
      <td><font face=arial size=2>Nom : </td><td><input type=text name=nomLecteur></td>
    </tr><tr>
      <td><font face=arial size=2>Mot de passe : </td><td><input type=password name=motDePasse></td>
    </tr>
    </table>
      <input type=submit value=Valider>
    </form>
<%
}
%>
