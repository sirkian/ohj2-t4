<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/style.css">
<title>Asiakas CRUD</title>
</head>
<body>
<table id="lista">
	<thead>
		<tr>
			<th colspan="5" class="alignR"><span id="uusiAsiakas">Lis�� asiakas</span></th>
		</tr>
		<tr>
			<th colspan="3" class="alignR">Hakusana:</th>
			<th><input type="text" id="hakusana"></th>
			<th><input type="button" value="Hae" id="hakunappi"></th>
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
	</tbody>
</table>
<script>
	$(document).ready(function() {

		$("#uusiAsiakas").click(function() {
			document.location="lisaaasiakas.jsp";
		});
		
		haeAsiakkaat();
		$("#hakunappi").click(function() {
			haeAsiakkaat();
		});
		$(document.body).on("keydown", function(event) {
			if (event.which == 13) {
				haeAsiakkaat();
			}
		});
		$("#hakusana").focus();
	});
	
	function haeAsiakkaat() {
		$("#lista tbody").empty();
		$.ajax({url:"asiakkaat/"+$("#hakusana").val(), type:"GET", dataType:"json", success:function(result) {
			$.each(result.asiakkaat, function(i, field) {
				var htmlStr;
				htmlStr += "<tr id='rivi_"+field.asiakas_id+"'>>";
				htmlStr += "<td>" + field.etunimi + "</td>";
				htmlStr += "<td>" + field.sukunimi + "</td>";
				htmlStr += "<td>" + field.puhelin + "</td>";
				htmlStr += "<td>" + field.sposti + "</td>";
				htmlStr += "<td><a href='muutaasiakas.jsp?asiakas_id="+field.asiakas_id+"'>Muuta</a>&nbsp";
				htmlStr += "<span class='poista' onclick=poista("+field.asiakas_id+",'"+field.etunimi+"','"+field.sukunimi+"')>Poista</span></td>";
				htmlStr += "</tr>";
				$("#lista tbody").append(htmlStr);
			});
		}});
	}
	
	function poista(asiakas_id, etunimi, sukunimi) {
		$("#rivi_"+asiakas_id).css("background-color", "#db5a5a");
		if (confirm("Poista asiakas " + etunimi + " " + sukunimi + "?")) {
			$.ajax({url:"asiakkaat/"+asiakas_id, type:"DELETE", dataType:"json", success:function(result) {
				if (result.response == 0) {
					$("#ilmo").html("Asiakkaan poisto ep�onnistui")
				} else if (result.response == 1) {
					$("#rivi_"+asiakas_id).css("background-color", "#db5a5a");
					alert ("Asiakkaan " + etunimi + " " + sukunimi + " poisto onnistui");
					haeAsiakkaat();
				}
			}});
		} else {
			haeAsiakkaat();
		}
	}
</script>
</body>
</html>