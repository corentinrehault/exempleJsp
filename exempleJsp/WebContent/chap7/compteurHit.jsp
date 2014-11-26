<!-- 
#	Initiation à JSP
#	A. Tasso, S. Ermacore
#	Exemples Chapitre 7 : Les servlets ou les dessous cachés de JSP
#	Section : Du JSP à la servletn - Exemple de servlet générée par l'interpréteur JSP
-->
<html>
<head>
<title>Un compteur de Hit</title>
</head>
<body>
<%! int compteur = 0 ; %> 


<%-- début de la scriptlet --%>
<%       compteur++ ;
	if ( compteur == 1 ) {
		out.println("Bonjour : <BR> ");
		out.println("C'est la première fois que cette page est chargée ");
	}
	else {
		out.println("Cette page a été chargée " + compteur + " fois" ); 
	}
   
%>
<%-- fin de la scriptlet --%>
</body>
</html>

