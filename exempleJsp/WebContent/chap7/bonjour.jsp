<!-- 
#	Initiation � JSP
#	A. Tasso, S. Ermacore
#	Exemples Chapitre 7 : Les servlets ou les dessous cach�s de JSP
#	Section : Du JSP � la servlet - O� et comment d�clarer les variables
-->

<html>
<head>
<title>Bonjour <%=prenom%></title>
</head>
<body>
<%
 out.println("Mon pr�nom est dans la barre de titre ! <br>" ); 
%>

<%! String prenom="Capucine"; %> 


</body>
</html>

