<!-- 
#	Initiation � JSP
#	A. Tasso, S. Ermacore
#	Exemples Chapitre 7 : Les servlets ou les dessous cach�s de JSP
#	Section : Du JSP � la servlet - Les diff�rentes �tapes de la traduction
-->
<html>
<head>
<title>Deux compteurs</title>
</head>
<body>
<%! int compteurInstance; %> 
<%-- d�but de la scriptlet --%>
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

