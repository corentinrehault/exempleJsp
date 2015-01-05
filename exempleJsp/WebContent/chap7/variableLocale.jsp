<!-- 
#	Initiation à JSP
#	A. Tasso, S. Ermacore
#	Exemples Chapitre 7 : Les servlets ou les dessous cachés de JSP
#	Section : Du JSP à la servlet - Les différentes étapes de traduction
-->
<html>
<head>
<title>Variable locale</title>
</head>
<body>

<%-- debut de la scriptlet ici--%>
<%      
 int varLocal;
 out.println("Variable locale : " + varLocal); 
 //int varLocal;
%>
<%-- fin de la scriptlet --%>
</body>
</html>

