<!-- 
#	Initiation à JSP
#	A. Tasso, S. Ermacore
#	Exemples Chapitre 1 : Concepts Fondamentaux 
#	Section : Emplacement des variables et temps d'utilisation
-->

<html> 
<head> 
<title> Une terre et plusieurs planètes</title> 
</head>
<%! int planete = 1; %>
<%  int terre = 1; %>   
 Terre : <%= terre%> <BR>
 Planète(s) :  <%= planete%> <BR>
<%
 planete = planete + 1;
 terre = terre + 1; 
%>



</body> 
</html>
