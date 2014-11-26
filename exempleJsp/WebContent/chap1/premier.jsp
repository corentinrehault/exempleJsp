<!-- 
#	Initiation à JSP
#	A. Tasso, S. Ermacore
#	Exemples Chapitre 1 : Concepts Fondamentaux 
#	Section : Radiographie d'un script JSP
-->


<!-- Commentaire visible : Le premier JSP étudié --> 
<!-- Commentaire visible : Date : <%=(new java.util.Date( ))%>--> 
<html> 
<head> 
<title>Un premier exemple de JSP</title> 
</head> 

<%-- Commentaire caché : Déclaration d'objets ou de variables --%> 
<%! 
// Déclaration de chaines de caractères
String lFilm [] = { "Le grand bleu", "Jules et Jim", "La guerre du feu", "37°2 le matin"} ; 
String lRealisateur [] = { "L. Besson", "F. Truffaut", "J.-J. Annaud" , "J.-J. Beineix"}; 
String lAffiche = "" ; 

/* Déclaration d'un entier */ 
int i ; 
%> 

<body> 
<%-- Une sriptlet--%> 
<% 
lAffiche = "<table border=1>" ; 
lAffiche += "<TR> <TH>Réalisateur </TH><TH>Film</TH></TR>" ; 
for (i=0; i < 4; i++) { 
lAffiche += "<TR><TD>" + lRealisateur [i] + "</TD>" ;
lAffiche += "<TD>" + lFilm [i] + "</TD></TR>" ; 
} 
lAffiche += "</table>" ; 
%> 
<%-- Une expression --%> 
<%= lAffiche %> 
</body> 
</html>
