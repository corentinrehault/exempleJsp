<!-- 
#	Initiation � JSP
#	A. Tasso, S. Ermacore
#	Exemples Chapitre 6 : Conna�tre l'internaute
#	Section : Exemple : r�server un livre ne ligne
#
# 	Fichier : verificationLecteur.jsp
# 	Description : g�re la session du lecteur 
# 	JavaBeans : aucun
#
-->

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
     out.println ("<br><font face=arial color=black><b>Lecteur ou mot de passe inconnu <br></b></font>");  
  }

  // V�rifier si le nom du lecteur est enregistr� dans la session
  nomLecteur=(String)session.getAttribute("nomLecteur");
  // Si le lecteur est enregistr� dans la session
  if (nomLecteur!=null) {
%>
    <!--// Afficher le nom et pr�nom du lecteur -->
    <font face=arial size=2>Bonjour <b> <%=session.getAttribute("prenomLecteur")%> <%=session.getAttribute("nomLecteur")%> !</b><br> 
    <!--// Afficher le lien " Vous pouvez r�server � " -->
    <br>
    <font face=arial size=2>Vous pouvez emprunter des livres <a href=\"\">ici</a>
    <br><br>
<%
    // Si le lecteur n'est pas enregistr� dans la session
    } else {
%>
    <!--// Afficher le formulaire invitant le lecteur � s'identifier -->
    <font face=arial size=2> Vous n'�tes pas identifi�.<br>
     Vous devez vous identifier pour pouvoir emprunter des livres en ligne<br>
    <h2><font face=arial>Formulaire d'identification</h2>
    <form name=ident action="./pageAccueilSession.jsp" method=POST>
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

