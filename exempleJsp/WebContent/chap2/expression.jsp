<!-- 
#	Initiation à JSP
#	A. Tasso, S. Ermacore
#	Exemples Chapitre 2 : Communiquer avec l'internaute 
#	Section : Du JSP, pour des informations qui varient
-->

<%-- expression.jsp --%>
<%-- Exemple d'une expression simple --%> 
6 * 7 = <%= 6 * 7 %> <BR>
<%-- Exemple d'une expression utilisant la fonction Java random() --%> 
<%! java.util.Random hasard = new java.util.Random(); %>
Au hasard : <%=hasard.nextInt()%>
