<!-- 
#	Initiation � JSP
#	A. Tasso, S. Ermacore
#	Exemples Chapitre 3 : Les structures de la programmation Java 
#	Section : Les boucles - La boucle while
-->

<HTML>
<HEAD>
<%! 
// D�claration de chaines de caract�res
String lFilm [] = { "Le grand bleu", "Le fabuleux destin d'Am�lie Poulain", "La guerre du feu", "37�2 le matin"} ; 
%>
<%  
   String parametre = request.getParameter("film");  
   if (parametre == null) {
      out.println(" <TITLE> La question ....  </TITLE>");
      out.println(" </HEAD>");
      out.println(" <BODY bgcolor=white> <BR>");
%>
<!-- Debut du formulaire html-->
<FORM ACTION="quiFaitQuoi_while.jsp" method="post"> <ul><ul>
<p><h1>Quel film a r�alis� Jean Jacques Beineix ?</h1><br></p>
<% 
       String chaineF ="<select name=film>\n";
       int i = 0;
       // La boucle while
       while (i < lFilm.length) {
          chaineF +="<option value=" + i +">" + lFilm[i] + "</option >\n";
          i++;
       }
      chaineF = chaineF + "</select>";  
%> 
<%= chaineF %>
<input type="submit" value="OK"> </p>
</FORM>
<!-- Fin du formulaire html-->
<%
   }  else {
         out.println(" <TITLE> La r�ponse ....  </TITLE>");
         out.println(" </HEAD>");
         out.println(" <BODY bgcolor=white> <BR>");
         int valeurF= Integer.parseInt(parametre);
         if (valeurF==3)   out.println("Vous avez gagn�");
         else              out.println("Vous avez perdu");     
   }
%>
</BODY>
</HTML>
