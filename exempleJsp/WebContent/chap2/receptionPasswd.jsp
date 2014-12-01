<!-- 
#	Initiation à JSP
#	A. Tasso, S. Ermacore
#	Exemples Chapitre 2 : Communiquer avec l'internaute 
#	Section : Transmettre des données d'un script à un autre
-->

<!-- receptionPasswd.jsp -->
<%  
  String motDePasse= request.getParameter("secret");
  out.println("Votre mot de passe : " + motDePasse);
%>
