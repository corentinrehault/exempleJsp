<!-- 
#	Initiation � JSP
#	A. Tasso, S. Ermacore
#	Exemples Chapitre 1 : Concepts Fondamentaux 
#	Section : La transformation de types avec les Questions R�ponses
-->

<html> 
<head> 
<title> Changer de type </title> 
</head>

<%!
 int a = 4, result_int ;
 float x = 2.0f, result_float ;
%>

<%
 result_float = a / x ;
 result_int = (int) (a / x) ;
%> 


a : <%=a%><br>
x : <%=x%><br>
result_float : <%=result_float%><br>
result_int : <%=result_int%><br>
<br>

<%! 
  int premier = 5, second = 3, coefficient = 2 ;
  double r�sultat ;
%> 
<% r�sultat = (double) coefficient * premier / second ; %>


premier     : <%=premier%><br>
second      : <%=second%><br>
coefficient : <%=coefficient%><br>
r�sultat = (double) coefficient * premier / second = <%=r�sultat%><br>
<br>
<% r�sultat = (double) (coefficient * premier / second); %>


r�sultat = (double) (coefficient * premier / second) = <%=r�sultat%><br>
<br>
<%!
  String  sVal1 = "5", sVal2="3.14" ;
  int val1 = Integer.parseInt(sVal1);
  float val2 = Float.parseFloat(sVal2) ;
  float result = val1 + val2 ;
%>

sVal1     : <%=sVal1%><br>
sVal2     : <%=sVal2%><br>
val1      : <%=val1%><br>
val2      : <%=val2%><br>
result    : <%=result%><br>
<%! String sResult  = sVal1 + sVal2 ; %>
sResult    : <%=sResult%><br>
<br>



<%!
  // 2.5 ne peut pas �tre converti en entier
  //String  sTest2 = "2.5" ;
  //int test2 = Integer.parseInt(sTest2);
%>


</body> 
</html>
