<!-- 
#	Initiation à JSP
#	A. Tasso, S. Ermacore
#	Exemples Chapitre 7 : Les servlets ou les dessous cachés de JSP
#	Section : Du JSP à la servlet - Où et comment déclarer les variables
-->

<html>
<head>
<title>Bonjour <%=prenom%></title>
</head>
<body>
<%
 out.println("Mon prénom est dans la barre de titre ! <br>" ); 
%>

<%! String prenom="Capucine"; %> 


</body>
</html>

