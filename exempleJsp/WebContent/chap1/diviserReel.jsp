<!-- 
#	Initiation � JSP
#	A. Tasso, S. Ermacore
#	Exemples Chapitre 1 : Concepts Fondamentaux 
#	Section : Le type d'une expression math�matique - diviser deux r�els
-->


<html> 
<head> 
<title> Diviser deux reels</title> 
</head>

<%! double x = 5 , y = 2, z ;%>
<% z = x / y ; %>

x : <%=x%> <BR>
y : <%=y%> <BR>
z = x / y : <%=z%> <BR>

<%! double r�sultat, premier = 5, second = 3, coefficient = 2 ; %>
<% r�sultat = coefficient * premier / second ; %>

premier     : <%=premier%> <BR>
second      : <%=second%> <BR>
coefficient : <%=coefficient%> <BR>
r�sultat = coefficient * premier / second : <%=r�sultat%> <BR>

<% r�sultat = premier / second * coefficient; %>
r�sultat = premier / second * coefficient : <%=r�sultat%> <BR>


</body> 
</html>
