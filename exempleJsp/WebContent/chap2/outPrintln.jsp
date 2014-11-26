<!-- 
#	Initiation à JSP
#	A. Tasso, S. Ermacore
#	Exemples Chapitre 2 : Communiquer avec l'internaute 
#	Section : Du JSP, pour des informations qui varient 
-->

<%-- outPrintln.jsp --%>
<%-- Exemple d'une expression simple --%> 
<%
   out.println("6 * 7 = " + ( 6 * 7 ) + " <BR> ");
%>
<%-- Exemple d'une expression utilisant la fonction Java random() --%> 
<%! java.util.Random hasard = new java.util.Random(); %>
<%
   out.println("hasard = " + hasard.nextInt());
%>
