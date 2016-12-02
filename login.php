<html>
<head>
	<meta charset="UTF-8">
	<title>Ingreso al Software de Gestion Documental JONAS</title>
	<link href="imagenes/logo5.png" type="image/x-icon" rel="shorttcut icon"/>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<!--Esta es la parte que se visualiza en la pestaña del navegador-->
		<title>Ingreso al SGD JONAS</title>
<!--Esta es el href a los archivos que necesito para usar jquery, css-->
	<link rel="stylesheet" href="include/css/estilos_login.css"> 
	<script type="text/javascript" src="include/js/jquery.js"></script>
	<script type="text/javascript" src="include/js/funciones_login.js"></script>
</head>
<body>	
	<div id="general">
			<div class="form">
				<img src="imagenes/encabezado_transparente.png" alt="Logo Jonas" width="70%" >
				<h1>Ingreso al Software de Gestion Documental</h1>
				<hr>
				<br>
				<form action="principal3.php" method="POST" id ="formulario_login" name ="formulario_login" >
					<table>
						<tr>
							<td width="100%">
								<center>
								<input type="text" name="user" id="user"
								 placeholder="Ingrese Nombre de Usuario" >
								<div id="sugerencias_user"></div>

								</center>
							</td>
						</tr>
					</table>
				</form>		



</body>
</html>

