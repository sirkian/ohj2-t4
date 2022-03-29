<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="scripts/main.js"></script>
<link rel="stylesheet" type="text/css" href="css/style.css">
<title>Lis�� asiakas</title>
</head>
<body onkeydown="tutkiKey(event)">
<form id="lomake">
	<table>
		<thead>
			<tr>
				<th colspan="3" id="ilmo"></th>
				<th colspan="2" class="alignR"><a href="listaaasiakkaat.jsp" id="takaisin">Palaa takaisin</a></th>
			</tr>
			<tr>
				<th>Etunimi</th>
				<th>Sukunimi</th>
				<th>Puhelin</th>
				<th>Sposti</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><input type="text" name="etunimi" id="etunimi"></td>
				<td><input type="text" name="sukunimi" id="sukunimi"></td>
				<td><input type="text" name="puhelin" id="puhelin"></td>
				<td><input type="text" name="sposti" id="sposti"></td>
				<td><input type="button" name="btn" id="tallenna" value="Lis��" onclick="lisaaTiedot()"></td>
			</tr>
		</tbody>
	</table>
</form>
<span id="ilmo"></span>
</body>
<script>
document.getElementById("etunimi").focus();

const tutkiKey = (event) => {
	if (event.keyCode == 13) {
		lisaaTiedot();
	}
}

function lisaaTiedot() {
	var ilmo = "";
	if (document.getElementById("etunimi").value.length < 2) {
		ilmo = "Etunimi on liian lyhyt";
	} else if (document.getElementById("sukunimi").value.length < 2) {
		ilmo = "Sukunimi on liian lyhyt";
	} else if (document.getElementById("puhelin").value.length < 10 ||
				document.getElementById("puhelin").value.length > 14) {
		ilmo = "Puhelinnumero ei kelpaa";
	} else if (document.getElementById("sposti").value.length < 5) {
		ilmo = "Spostiosoite on liian lyhyt";
	}
	if (ilmo != "") {
		document.getElementById("ilmo").innerHTML = ilmo;
		setTimeout(function(){ document.getElementById("ilmo").innerHTML=""; }, 3000);
		return;
	}
	document.getElementById("etunimi").value=siivoa(document.getElementById("etunimi").value);
	document.getElementById("sukunimi").value=siivoa(document.getElementById("sukunimi").value);
	document.getElementById("puhelin").value=siivoa(document.getElementById("puhelin").value);
	document.getElementById("sposti").value=siivoa(document.getElementById("sposti").value);
	
	var formJsonStr = formDataToJSON(document.getElementById("lomake"));
	console.log(formJsonStr);
	
	fetch ("asiakkaat", {method:'POST', body:formJsonStr})
		.then (function (response) {
			return response.json()
		})
		.then (function (responseJson) {
			var vastaus = responseJson.response;
			if (vastaus == 0) {
				document.getElementById("ilmo").innerHTML= "Asiakkaan lis��minen ep�onnistui";
			} else if (vastaus == 1) {
				document.getElementById("ilmo").innerHTML= "Asiakkaan lis��minen onnistui";
			}
			setTimeout(function(){ document.getElementById("ilmo").innerHTML=""; }, 5000);
		});
	document.getElementById("lomake").reset();
}
</script>
</html>