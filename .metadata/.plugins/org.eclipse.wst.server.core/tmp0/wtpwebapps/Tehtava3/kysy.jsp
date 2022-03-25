<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Etätehtävä 3</title>
<style>
	.container {
		box-sizing: border-box;
		margin: 0;
		padding: 0 3em;
		width: 25em;
		position: absolute;
	}
	input[type=text],
	input[type=email] {
		width: 100%;
		border: none;
		border-bottom: 1px solid gray;
		padding: .5em;
		margin-bottom: .6em;
	}
	#vuosi {
		width: 20%;
		margin-top: 1em;
		text-align: center;
	}
	input[type=submit] {
		padding: .4em;
		background-color: white;
		border: none;
		border-bottom: 1px solid gray;
		position: relative;
		left: 90%;
		bottom: 2.65em;
	}
	input[type=submit]:hover {
		background-color: lightgray;
	}
	h1 {
		font-size: 1.6em;
		font-weight: 400;
	}
</style>
</head>
<body>
	<div class="container">
		<h1>Anna tiedot</h1>
		<form action="nayta.jsp" method="POST">
			Etunimi: <input type="text" name="etunimi"><br>
			Sukunimi: <input type="text" name="sukunimi"><br>
			Sähköpostiosoite: <input type="email" name="email"><br>
			Puhelinnumero: <input type="text" name="puhelin"><br>
			Syntymävuosi: <input id="vuosi" type="text" name="svuosi"><br>
			<input type="submit" value="Lähetä">
		</form>
	</div>
</body>
</html>