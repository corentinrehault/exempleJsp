<!-- 
#	Initiation � JSP
#	A. Tasso, S. Ermacore
#	Exemples Chapitre 3 : Les structures de la programmation Java 
#	Section : Les boucles - La boucle do-while
-->

<HTML>
<HEAD>
<%! 
   // D�claration de chaines de caract�res
   String lRealisateur [] = { "L. Besson", "J.-P. Jeunet", "J.-J. Annaud" , "J.-J. Beineix"}; 	
%>
<%  
   String parametre = request.getParameter("auteur");
   if (parametre == null) {
      out.println(" <TITLE> La question ....  </TITLE>");
      out.println(" </HEAD>");
      out.println(" <BODY bgcolor=white> <BR>");
%>
<!-- Debut du formulaire html-->
<FORM ACTION="quiFaitQuoi_do_while.jsp" METHOD "POST"> <ul><ul>
<p><h1>Quel est le r�alisateur du film <i> La guerre du feu </i>?</h1><br></p>
<% 
   String chaineR ="<select name=auteur>\n";
   int j = 0;
   // La boucle do-while
   do {
        chaineR +="<option value=" + j +">" + lRealisateur[j] + "</option >\n";
        j++;
   } while (j < lRealisateur.length) ;
   chaineR += "</select>";  
%> 
<%= chaineR %>
</P><P><input type="submit" value="OK"> </p>
</FORM>
<!-- Fin du formulaire html-->
<%
   }  else {
      out.println(" <TITLE> La r�ponse ....  </TITLE>");
      out.println(" </HEAD>");
      out.println(" <BODY bgcolor=white> <BR>");
      int valeur= Integer.parseInt(parametre);
      if (valeur == 2)   out.println("Vous avez gagn�");
      else               out.println("Vous avez perdu");  
   }
%>
</BODY>
</HTML>
