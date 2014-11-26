<!-- 
#	Initiation à JSP
#	A. Tasso, S. Ermacore
#	Exemples Chapitre 3 : Les structures de la programmation Java 
#	Section : Les tests - La structure if-else
-->

<HTML>
<HEAD>
<%  
    String parametre = request.getParameter("valeur");
    // La structure if
    if ( parametre == null ) {
        out.println(" <TITLE> La question ....  </TITLE>");
        out.println(" </HEAD>");
        out.println(" <BODY bgcolor=white> <BR>");
%>                         <!-- Debut du formulaire html-->
   <FORM ACTION="quiFaitQuoi_if.jsp" METHOD "POST">
   <ul><ul>
   <p><h1>Quel est le réalisateur du film <i> La guerre du feu</i> ?</h1><br></p>
   <input type="Radio" name="valeur" value="0">  Jean-Jacques Beinex <br><br>
   <input type="Radio" name="valeur" value="1">  Luc Besson <br><br>
   <input type="Radio" name="valeur" value="2">  Jean-Jacques Annaud  <br><br>
   <input type="Radio" name="valeur" value="3">  Jean-Pierre Jeunet <br><br>
   <input type="submit" value="OK"> </p>
  </FORM>
<!-- Fin du formulaire html-->

<%
     } 
     // suivi de else
     else {
	out.println(" <TITLE> La réponse ....  </TITLE>");
	out.println(" </HEAD>");
	out.println(" <BODY bgcolor=white <BR>");
	out.println(" La bonne réponse est : <BR> Jean-Jacques Annaud");
     }
%>                       
</HEAD>
</HTML>
