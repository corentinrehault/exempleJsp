<!-- 
#	Initiation � JSP
#	A. Tasso, S. Ermacore
#	Exemples Chapitre 2 : Communiquer avec l'internaute 
#	Section : Transmettre des donn�es d'un script � un autre
-->

<!-- receptionPasswd.jsp -->
<%  
  String motDePasse= request.getParameter("secret");
  out.println("Votre mot de passe : " + motDePasse);
%>
