<!-- 
#	Initiation � JSP
#	A. Tasso, S. Ermacore
#	Exemples Chapitre 7 : Les servlets ou les dessous cach�s de JSP
#	Section : Du JSP � la servletn - Exemple de servlet g�n�r�e par l'interpr�teur JSP
-->
<html>
<head>
<title>Un compteur de Hit</title>
</head>
<body>
<%! int compteur = 0 ; %> 


<%-- d�but de la scriptlet --%>
<%       compteur++ ;
	if ( compteur == 1 ) {
		out.println("Bonjour : <BR> ");
		out.println("C'est la premi�re fois que cette page est charg�e ");
	}
	else {
		out.println("Cette page a �t� charg�e " + compteur + " fois" ); 
	}
   
%>
<%-- fin de la scriptlet --%>
</body>
</html>

