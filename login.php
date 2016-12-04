<html>
<head>
	<meta charset="UTF-8">
	<title>Ingreso al Software de Gestion Documental JONAS</title>
	<link href="http://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet" type ="text/css">
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
				<img src="imagenes/encabezado_transparente.png" id="logo_principal">
				<h1>Software de Gestión Documental</h1>
				<hr>
				<form action="principal3.php" method="POST" id ="formulario_login" name ="formulario_login" >
					<table>
						<tr>
							<td width="100%">
								<center>
								<div class="casilla">
									<img src="imagenes/iconos/icono_user.png" width="50px">
									<input type="text" name="user" id="user"
									 placeholder="Ingrese Usuario" onkeyup="upper_user()" maxlength='18'>
								 </div>
								
								 <div class="casilla">
								 	<img src="imagenes/iconos/icono_lock.png" width="50px">
									<input type="password" name="pass" id="pass"
									 placeholder="Ingrese Contraseña" >
								 </div>
								<div class="errores">El usuario y/o contraseña no son correctos. Por favor revisar.</div>
								</center>
								
							</td>
						</tr>
					</table>
				</form>		



</body>
</html>
