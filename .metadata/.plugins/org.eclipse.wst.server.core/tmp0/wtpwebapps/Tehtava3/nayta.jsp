<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Calendar" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Et�teht�v� 3</title>
</head>
<body>
<%
	String etunimi = request.getParameter("etunimi");
	String sukunimi = request.getParameter("sukunimi");
	String email = request.getParameter("email");
	String puhelin = request.getParameter("puhelin");
	String svuosiStr = request.getParameter("svuosi");
	
	Calendar calendar = Calendar.getInstance();
	int nytVuosi = calendar.get(Calendar.YEAR);
	int svuosi, ika = 0;
	
	try {
		svuosi = Integer.parseInt(svuosiStr);
		ika = nytVuosi - svuosi;
		if (ika >= 18) {
			out.print("Nimi: " + etunimi + "&nbsp;" + sukunimi + "<br>");
			out.print("S�hk�postiosoite: " + email + "<br>");
			out.print("Puhelinnumero: " + puhelin + "<br>");
			out.print("Ik�: " + ika);
		} else {
			out.print("Alaik�inen");
			response.setHeader("Refresh", "5;url=kysy.jsp");
		}
	} catch (Exception e) {
		out.print("Antamasi vuosiluku ei ole kelvollinen");
		response.setHeader("Refresh", "3;url=kysy.jsp");
	}	
%>
</body>
</html>