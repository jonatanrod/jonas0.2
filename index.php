<html>
<head>
	<meta charset="UTF-8">
	<title>Ingreso al Software de Gestion Documental JONAS</title>
	<!--<link href="http://fonts.googleapis.com/css?family=Roboto+Condensed" el="stylesheet" type ="text/css"> -->
	<link href="imagenes/logo5.png" type="image/x-icon" rel="shorttcut icon"/>
	<meta charset="utf-8" name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<!--Esta es la parte que se visualiza en la pestaña del navegador-->
		<title>Ingreso al SGD JONAS</title>
<!--Esta es el href a los archivos que necesito para usar jquery, css-->
	<link rel="stylesheet" href="include/css/estilos_login.css"> 
	<script type="text/javascript" src="include/js/jquery.js"></script>
	<script type="text/javascript" src="include/js/funciones_login.js"></script>
</head>
<body>	
<?php 
	session_unset();
	//session_destroy();
 ?>	
	<div id="general">
		<div class="form">
			<img src="imagenes/encabezado_transparente.png" id="logo_principal">
			<h1>Software de Gestión Documental</h1>
			<hr>
			<form action="principal3.php" method="POST" id ="formulario_login" name ="formulario_login" autocomplete="off">
				<table>
					<tr>
						<td width="100%">
							<center>
								<div>
									<img src="imagenes/iconos/icono_user.png" class="icono">
									<input type="text" name="user" id="user" class="textbox"
									 placeholder="Ingrese Usuario" onkeyup="upper_user()" maxlength='18'>
								 </div>
								 <div>
								 	<img src="imagenes/iconos/icono_lock.png" class="icono">
									<input type="password" name="pass" id="pass" class="textbox" onkeyup="if (event.keyCode==13){entra(); return false;}"
									 placeholder="Ingrese Contraseña" >
								 </div>
								<div>
									<br>
									<input type="button" value="Ingresar" id="boton_ingreso" class="boton" onclick="entra()" ></td>
								</div> 
							</center>	
							<div class="errores" id="error_user">El usuario y/o contraseña no son correctos. Por favor revisar.</div>
							<div class="errores" id="error_inactivo">El usuario se encuentra inactivo. Por favor comuniquese con el administrador del sistema.</div>
						</td>
					</tr>
				</table>
			</form>	
		</div>		
	</div>
</body>
</html>

