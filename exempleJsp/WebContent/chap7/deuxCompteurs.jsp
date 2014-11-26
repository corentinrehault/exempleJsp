<!-- 
#	Initiation à JSP
#	A. Tasso, S. Ermacore
#	Exemples Chapitre 7 : Les servlets ou les dessous cachés de JSP
#	Section : Du JSP à la servlet - Les différentes étapes de la traduction
-->
<html>
<head>
<title>Deux compteurs</title>
</head>
<body>
<%! int compteurInstance; %> 
<%-- début de la scriptlet --%>
<%      
 int compteurLocal = 0;
 out.println("Compteur instance  : " + compteurInstance +"<br>" ); 
 out.println("Compteur local     : " + compteurLocal); 
 compteurLocal++;
 compteurInstance++;
%>
<%-- fin de la scriptlet --%>
</body>
</html>

