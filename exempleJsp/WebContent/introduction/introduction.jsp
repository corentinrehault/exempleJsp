<!-- 
#	Initiation à JSP
#	A. Tasso, S. Ermacore
#	Exemples Introduction : Le comment ça marche du Web ...
#	Section : Etude d'un tout premier JSP
-->
<html>
	<head>
		<title>Un tout premier JSP dynamique</title>
	</head>
	<body>
<%  
	String parametre = request.getParameter("mot");
	if ( parametre != null ) {
		out.println("<P> Bravo ! vous avez dit : " + parametre + " </P>");
	}
	else {
	out.println("<P> Erreur : Il manque un paramètre,") ;
	out.println("tapez par exemple : <BR> ") ;
	out.println("http://localhost:8080/exemplesJSP/introduction/introduction.jsp?mot=bonjour <BR>");
	out.println("dans la barre de navigation </P>"); 
	}
%>

	</body>
</html>
