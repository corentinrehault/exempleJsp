<!-- 
#	Initiation à JSP
#	A. Tasso, S. Ermacore
#	Exemples Chapitre 3 : Les structures de la programmation Java 
#	Section : Les tests - La structure switch
-->

<HTML>
<HEAD>
<%  
  // Récupération des paramètres 
  String parametre = request.getParameter("valeur");
  if ( parametre == null ) {
      out.println(" <TITLE> La question ....  </TITLE>");
      out.println(" </HEAD>");
      out.println(" <BODY bgcolor=white> <BR>");
%>

<!-- Début du formulaire html-->
<FORM ACTION="quiFaitQuoi_switch.jsp" METHOD="POST">
<ul><ul> <p><h1>Quel est le réalisateur du film <i> La guerre du feu </i> ?</h1><br></p>
<input type="Radio" name="valeur" value="0">  Jean-Jacques Beinex <br><br>
<input type="Radio" name="valeur" value="1">  Luc Besson <br><br>
<input type="Radio" name="valeur" value="2">  Jean-Jacques Annaud  <br><br>
<input type="Radio" name="valeur" value="3">  Jean-Pierre Jeunet <br><br>
<input type="submit" value="OK"> </p>
</FORM>
<!-- Fin du formulaire html-->
<%
  } 
  else {
      out.println(" <TITLE> La réponse ....  </TITLE>");
      out.println(" </HEAD>");
      out.println(" <BODY bgcolor=white <BR>");
      int valeur=Integer.parseInt(parametre);
      // La structure switch
      switch (valeur) {
        case 2 : 
              out.println("Vous avez gagné !");  
              break;
       case 0 :  case 1 :
       case 3 : out.println("Vous avez perdu !");  
              break;   
     }
  }
%>  
</BODY>
</HTML>
