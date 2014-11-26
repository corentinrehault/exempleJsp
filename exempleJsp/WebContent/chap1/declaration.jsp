<!-- 
#	Initiation à JSP
#	A. Tasso, S. Ermacore
#	Exemples Chapitre 1 : Concepts Fondamentaux 
#	Section : Les balises de déclaration
-->


<html> 
<head> 
<title> Déclaration de variables</title> 
</head> 

<%! int valeur = 3; %>
<%! double reel = 5.3, imaginaire; %>
<%! String texte = "arbre"; %>
<%! java.util.Random hasard = new java.util.Random(); %>
valeur : <%=valeur%> <BR>
reel   : <%=reel%> <BR>
texte  : <%=texte%> <BR>
hasard : <%=hasard.nextInt()%> <BR>

<%!
float		f1 = 0.0f, f2 = 1.2f ;	
long		CodeBar = 123456789 ;	
int		test = 0 ;			
boolean 	OK = true ;	
%>
f1      : <%=f1%> <BR>
f2      : <%=f2%> <BR>
CodeBar : <%=CodeBar%> <BR>
test    : <%=test%> <BR>
OK      : <%=OK%> <BR>

<%! char choix = 'n' ; %> 
<%! String mot = "exemple"; %>
choix   : <%=choix%> <BR>
mot     : <%=mot%> <BR>

<%! double [] notes = {10, 12.5, 5, 8.5, 16, 0, 13, 7} ;%>
notes[0]	vaut	<%=notes[0]%> <BR>	
notes[1]	vaut	<%=notes[1]%> <BR>	
notes[2]	vaut	<%=notes[2]%> <BR>
notes[3]	vaut	<%=notes[3]%> <BR>	
notes[4]	vaut	<%=notes[4]%> <BR>
notes[5]	vaut	<%=notes[5]%> <BR>
notes[6]	vaut	<%=notes[6]%> <BR>
notes[7]	vaut	<%=notes[7]%> <BR>	
</body> 
</html>
