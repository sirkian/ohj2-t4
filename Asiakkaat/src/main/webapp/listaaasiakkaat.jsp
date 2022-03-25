<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Et�teht�v� 4</title>
<style>
body {
	font-family: sans-serif;
}
#lista {
	border-collapse: collapse;
}
.hakutxt {
	text-align: right;
}
input[type="button"] {
	padding: .1em .5em;
}
tr:nth-child(even) {
	background-color: #d4d4d4;
}
th {
	background-color: #37b33b;
	text-align: left;
	color: white;
	padding: .7em;
	border: 1px solid #dedede;
}
td {
	padding: .7em;	
	border: 1px solid #dedede;
}
</style>
</head>
<body>
<table id="lista">
	<thead>
		<tr>
			<th colspan="2" class="hakutxt">Hakusana:</th>
			<th><input type="text" id="hakusana"></th>
			<th><input type="button" value="Hae" id="hakunappi"></th>
		</tr>
		<tr>
			<th>Etunimi</th>
			<th>Sukunimi</th>
			<th>Puhelin</th>
			<th>Sposti</th>
		</tr>
	</thead>
	<tbody>
	</tbody>
</table>
<script>
	$(document).ready(function() {
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
				htmlStr += "<tr>";
				htmlStr += "<td>" + field.etunimi + "</td>";
				htmlStr += "<td>" + field.sukunimi + "</td>";
				htmlStr += "<td>" + field.puhelin + "</td>";
				htmlStr += "<td>" + field.sposti + "</td>";
				htmlStr += "</tr>";
				$("#lista tbody").append(htmlStr);
			});
		}});
	}
</script>
</body>
</html>