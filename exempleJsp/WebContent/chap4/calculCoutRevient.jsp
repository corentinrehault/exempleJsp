<!-- 
#	Initiation � JSP
#	A. Tasso, S. Ermacore
#	Exemples Chapitre 4 : Utiliser un objet Java dans un script
#	Section : Appeler un JavaBean depuis un JSP - Un exemple complet
# 
#	Remarque : Le code source du composant CoutDeRevient se trouve 
#                  dans exemplesJSP/WEB-INF/classes/exemple/Ch4 
-->
<jsp:useBean id="cdr" class="Exemples.Ch4.CoutDeRevient">
<!--// Code d'initialisation //-->
<jsp:setProperty name= "cdr" property="coutRoue" value="100"/>
<jsp:setProperty name= "cdr" property="coutCarrosserie" value="120"/>
<jsp:setProperty name= "cdr" property="coutMoteur" value="130"/>
<jsp:setProperty name= "cdr" property="coutVolant" value="140"/>
</jsp:useBean>

<html>
<body>
<h1><font face=arial>Co�t de revient de la voiture</font></h1>
<font face=arial size=2>Par d�faut la voiture co�te : 
<jsp:getProperty name= "cdr" property="coutRevient" /> euros </font><br>
<hr>
<!--// On r�cup�re les param�tres pass�s en POST par le formulaire -->
<jsp:setProperty name= "cdr" property="coutRoue"/>
<jsp:setProperty name= "cdr" property="coutCarrosserie"/>
<jsp:setProperty name= "cdr" property="coutMoteur"/>
<jsp:setProperty name= "cdr" property="coutVolant"/>

<h3><font face=arial>Formulaire de saisie des diff�rents co�ts des composants de la voiture</font></h3>

<form name="coutderevient" action="calculCoutRevient.jsp" method="POST">
<table>
<tr>
	<td><font face=arial size=2>Co�t de la roue :</font></td>
	<td><input type="text" size=10 name=coutRoue value=""></td>
	<td><font face=arial size=2>euros</font></td>
</tr><tr>
	<td><font face=arial size=2>Co�t de la carrosserie :</font></td>
	<td><input type="text" size=10 name=coutCarrosserie value=""></td>
	<td><font face=arial size=2>euros</font></td>
</tr><tr>
	<td><font face=arial size=2>Co�t du moteur :</font></td>
	<td><input type="text" size=10 name=coutMoteur value=""></td>
	<td><font face=arial size=2>euros</font></td>
</tr><tr>
	<td><font face=arial size=2>Co�t du volant :</font></td>
	<td><input type="text" size=10 name=coutVolant value=""></td>
	<td><font face=arial size=2>euros</font></td>
</tr>
</table>
<input type=submit value="Calculer">
</form>

<font face=arial size=2>Apr�s modification <br>
Co�t de revient de la voiture : <jsp:getProperty name= "cdr" property="coutRevient" /> euros </font><br>
</body>
</html>
