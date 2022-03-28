<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="scripts/main.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/style.css">
<title>Muuta asiakkaan tietoja</title>
</head>
<body>
<form id="lomake">
	<table>
		<thead>
			<tr>
				<th colspan="5" class="alignR"><span id="takaisin">Palaa takaisin</span></th>
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
				<td><input type="submit" id="tallenna" value="Muuta"></td>
			</tr>
		</tbody>
	</table>
	<input type="hidden" name="asiakas_id" id="asiakas_id">
</form>
<span id="ilmo"></span>
</body>
<script>
$(document).ready(function() {
	
	$("#takaisin").click(function() {
		document.location="listaaasiakkaat.jsp";
	});
	
	$("#etunimi").focus();
	
	var asiakas_id = requestURLParam("asiakas_id");
	$.ajax({url:"asiakkaat/haeyksi/"+asiakas_id, type:"GET", dataType:"json", success:function(result) {
		$("#asiakas_id").val(result.asiakas_id);
		$("#etunimi").val(result.etunimi);
		$("#sukunimi").val(result.sukunimi);
		$("#puhelin").val(result.puhelin);
		$("#sposti").val(result.sposti);
	}});
	
	$("#lomake").validate({
		rules: {
			etunimi: {
				required: true,
				minlength: 2
			},
			sukunimi: {
				required: true,
				minlength: 2
			},
			puhelin: {
				required: true,
				minlength: 10,
				maxlength: 14
			},
			sposti: {
				required: true,
				email: true
			}
		},
		messages: {
			etunimi: {
				required: "Pakollinen tieto",
				minlength: "Liian lyhyt nimi"
			},
			sukunimi: {
				required: "Pakollinen tieto",
				minlength: "Liian lyhyt nimi"
			},
			puhelin: {
				required: "Pakollinen tieto",
				minlength: "Liian lyhyt numero",
				maxlength: "Liian pitkä numero"
			},
			sposti: {
				required: "Pakollinen tieto",
				email: "Virheellinen osoite"
			}		
		},
		submitHandler: function(form) {
			paivitaTiedot();
		}	
	});
});
function paivitaTiedot() {
	var formJsonStr = formDataJsonStr($("#lomake").serializeArray());
	$.ajax ({url:"asiakkaat", data:formJsonStr, type:"PUT", dataType:"json", success:function(result) {
		if (result.response == 0) {
			$("#ilmo").html("Asiakkaan päivittäminen epäonnistui");
		} else if (result.response == 1) {
			$("#ilmo").html("Asiakkaan päivittäminen onnistui");
			$("#etunimi", "#sukunimi", "#puhelin", "#sposti").val("");
		}
	}});
}
</script>
</html>