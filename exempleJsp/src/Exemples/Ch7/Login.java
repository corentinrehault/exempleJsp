/*
#	Initiation à JSP
#	A. Tasso, S. Ermacore
#	Exemples Chapitre 7 : Les servlets ou les dessous cachés de JSP
#	Section : Construire ses propres servlets - Une première servlet
#	Fichier : Login.java
#	Class : Login
*/

package Exemples.Ch7 ;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class Login extends HttpServlet {
	
 // doGet() est appelée lorsque la requête est passée en mode GET	
 public void doGet( HttpServletRequest req, HttpServletResponse rep)throws IOException, ServletException {
   rep.setContentType("text/html");
   PrintWriter pw = rep.getWriter();
   pw.println("<html>");
   pw.println("<head>");
   pw.println("<title> Servlet Login avec Get </title>");
   pw.println("</head>");
   pw.println("<body bgcolor='white'>");
   pw.println("<h2><font face=arial>Formulaire d'identification</h2>");
   pw.println("<form name=ident action=http://localhost:8080/exemplesJSP/servlet/Login method=POST>");
   pw.println("<table>");
   pw.println("<tr>");
   pw.println("<td><font face=arial size=2>Nom : </td>");
   pw.println("<td><input type=text name=nomLecteur></td>");
   pw.println("</tr><tr>");
   pw.println("<td><font face=arial size=2>Mot de passe : </td>");
   pw.println("<td><input type=password name=motDePasse></td>");
   pw.println("</tr>");
   pw.println("</table>");
   pw.println("<input type=submit value=Login>");
   pw.println("</form>");
   
   pw.println("</body>");
   pw.println("</html>");
 }  

 // doPost() est appelée lorsque la requête est passée en mode POST  
 public void doPost( HttpServletRequest req, HttpServletResponse rep)throws IOException, ServletException {
   rep.setContentType("text/html");
   PrintWriter pw = rep.getWriter();
 
   String nom = req.getParameter("nomLecteur");
   String secret = req.getParameter("motDePasse");
      
   pw.println("<html>");
   pw.println("<head>");
   pw.println("<title> Servlet Login avec POST </title>");
   pw.println("</head>");
   pw.println("<body bgcolor='white'>");
   pw.println("<h2><font face=arial>Vos identifiants : </h2>");
   pw.println("<table>");
   pw.println("<tr>");
   pw.println("<td><font face=arial size=2><b>Nom : </b>"+nom+"</td>");
   pw.println("</tr><tr>");
   pw.println("<td><font face=arial size=2><b>Mot de passe : </b>"+secret+"</td>");
   pw.println("</tr>");
   pw.println("</table>");
   pw.println("</body>");
   pw.println("</html>");
 }   
}