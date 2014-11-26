<!-- 
#	Initiation à JSP
#	A. Tasso, S. Ermacore
#	Exemples Chapitre 3 : Les structures de la programmation Java 
#	Section : Les fonctions
-->

<HTML>
<HEAD>
<%! 
   String lFilm [] = { "Le grand bleu", "Le fabuleux destin d'Amélie Poulain", "La guerre du feu", "37°2 le matin"} ; 
   String lRealisateur [] = { "J.-J. Beineix", "J.-J. Annaud" , "J.-P. Jeunet","L. Besson"  }; 
%> 
<%!
// Définition de la fonction fSelect()
public String fSelect(String [] liste, String nom) {
  String chaine ="<select name="+nom+">";
  int i = 0; 
  while ( i<liste.length) {
    chaine +="<option value=" + i + ">" + liste[i] + "</option >";
    i++; 
  } 
  chaine = chaine + "</select>";
  return chaine;
 }
%>     
<%  
   String parametreR = request.getParameter("auteur");
   String parametreF = request.getParameter("film");
   if (parametreF == null || parametreR == null) {
       out.println(" <TITLE> La question ....  </TITLE>");
       out.println(" </HEAD>");
       out.println(" <BODY bgcolor=white> <BR>");
%>
<!-- Debut du formulaire html-->
<FORM ACTION="quiFaitQuoi_fonction.jsp" METHOD "POST">
<% 
    // Appel de la fonction fSelect()
    String chaineR = fSelect(lRealisateur, "auteur");
    String chaineF = fSelect(lFilm, "film");
%>      
<p><h1>Quel  réalisateur  ?</h1><br></p>
<%= chaineR %>
<p><h1>Quel  film  ?</h1><br></p>
<%= chaineF %>
</P><P><input type="submit" value="OK"> </p>
</FORM>
<!-- Fin du formulaire html-->
<%
  }   else {
            out.println(" <TITLE> La réponse ....  </TITLE>");
            out.println(" </HEAD>");
            out.println(" <BODY bgcolor=white> <BR>");
            int valeurR= Integer.parseInt(parametreR);
            int valeurF= Integer.parseInt(parametreF);
            if (valeurR + valeurF == lRealisateur.length-1)  out.println("Vous avez gagné");
            else   out.println("Vous avez perdu");  
   }
%>
</BODY>
</HTML>
