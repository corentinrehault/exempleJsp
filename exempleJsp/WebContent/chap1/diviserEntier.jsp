<!-- 
#	Initiation à JSP
#	A. Tasso, S. Ermacore
#	Exemples Chapitre 1 : Concepts Fondamentaux 
#	Section : Le type d'une expression mathématique - diviser deux entiers
-->


<html> 
<head> 
<title> Diviser deux entiers</title> 
</head>

<%! int x = 5 , y = 2, z ; %>
<% z = x / y ; %>

x : <%=x%> <BR>
y : <%=y%> <BR>
z = x / y : <%=z%> <BR>

<%! int résultat, premier = 5, second = 3, coefficient = 2 ; %>
<% résultat = coefficient * premier / second ; %>

premier     : <%=premier%> <BR>
second      : <%=second%> <BR>
coefficient : <%=coefficient%> <BR>
résultat = coefficient * premier / second : <%=résultat%> <BR>

<% résultat = premier / second * coefficient; %>
résultat = premier / second * coefficient : <%=résultat%> <BR>


</body> 
</html>
