<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
p {
	padding: 0 0 1em 1em;
}
input {
	background: lightgrey;
	border-radius:0.35em;
	padding: 0.2em;
	margin: 0.15em 0;
	position: absolute;
}
.nimi {
	left: 5.4em;
}
.pw {
	top: 4.1em;
}
.btn {
	top: 6.4em;
	left: 13em;
}
form {
	letter-spacing: 0.03em;
	border: black 2px solid;
}
</style>
</head>
<body>
heloust
<a href="toka.jsp?nimi=jaska&ika=10">L�het�</a>
<form action="kolmas.jsp" method="POST">
	Nimi: <input class="nimi" type="text" name="nimi"><br>
	Salasana: <input class="pw" type="password" name="pwd">
	<input class="btn" type="submit" value="L�het�">
</form>
</body>
</html>