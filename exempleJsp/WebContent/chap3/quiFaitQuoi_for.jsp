<!-- 
#	Initiation à JSP
#	A. Tasso, S. Ermacore
#	Exemples Chapitre 3 : Les structures de la programmation Java 
#	Section : Les boucles - La boucle for
-->
<HTML>
<HEAD>
<%!// Déclaration de chaînes de caractères
	String lRealisateur[] = { "L. Besson", "J.-P. Jeunet", "J.-J. Annaud",
			"J.-J. Beineix" };%>
<%
	String parametre = request.getParameter("valeur");
	if (parametre == null) {
		out.println(" <TITLE> La question ....  </TITLE>");
		out.println(" </HEAD>");
		out.println(" <BODY bgcolor=white> <BR>");
%>

<!-- Debut du formulaire html-->
<FORM ACTION="quiFaitQuoi_for.jsp" METHOD="post">
	<ul>
		<ul>
			<p>
			<h1>
				Quel est le réalisateur du film <i> La guerre du feu </i>?
			</h1>
			<br>
			</p>
			<%
				// La boucle for 
					for (int i = 0; i < lRealisateur.length; i++) {
						out.println("<input type=Radio name=valeur value=" + i
								+ "> " + lRealisateur[i] + " <br><br>");
					}
			%>
			<input type="submit" value="OK">
			</p>
</FORM>
<!-- Fin du formulaire html-->
<%
	} else {
		out.println(" <TITLE> La réponse ....  </TITLE>");
		out.println(" </HEAD>");
		out.println(" <BODY bgcolor=white> <BR>");
		int valeur = Integer.parseInt(parametre);
		switch (valeur) {
		case 2:
			out.println("Vous avez gagné !");
			break;
		case 0:
		case 1:
		case 3:
			out.println("Vous avez perdu !");
			break;
		}
	}
%>

</BODY>
</HTML>
