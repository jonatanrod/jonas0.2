<?php 
	session_start();

	//require_once("../login/validar_inactividad.php");
	//	var_dump($_SESSION);
	$perfil=$_SESSION['perfil'];
	$usuario=$_SESSION['nombre'];
	$id_usuario=$_SESSION['id_usuario'];
 ?>
<!DOCTYPE html>
<html > 
<head>
	<meta charset="UTF-8">
	<title>Buscador de Usuarios</title>
	<script type="text/javascript" src="include/js/funciones_usuarios.js"></script>
	<link rel="stylesheet" href="include/css/estilos_usuarios.css">
</head>
<body>
	<script>
		$('#pass1').focus();
	</script>
	
<!-- Desde aqui el div que tiene el formulario principal -->
	<div class="center" id="logo">
		<img src="imagenes/logo5.png" width="100" alt="Jonas SGD" title="Logo Jonas">	
		<h1 style="margin-top:-10px;">Cambiar Contraseña 
			<?php 
				echo "<h2>$usuario</h2>
				<input type='hidden' id='id_usuario' value='$id_usuario'>
				";
	 		?>
	 	</h1>
		<form action="javascript:cambio_pass()" method="post" id="envia_pass" class="form">
			<center>
			<table width='50%'>
				<tr>
					<td>
	 					<center>
	 						<input type="password" id="pass1" name="pass1" placeholder="Ingrese su nuevo password" onkeyup="if (event.keyCode==13){modificar_pass_usuario(); return false;}">	
							<div id="valida_pass_vacio" class="errores">El password no puede ser menor a 6 caracteres</div>
	 					</center>
					</td>
				</tr>
				<tr>
					<td>
						<center>
							<input type="password" id="pass2" name="pass2" placeholder="Confirme su nuevo password"  onkeyup="if (event.keyCode==13){modificar_pass_usuario(); return false;}">	
							<div id="valida_pass_confirmacion" class="errores">El password de confirmacion no corresponde al ingresado</div>
						</center>			
					</td>
				</tr>
				<tr>
					<td>
						<center>
							<input type="button" value="Cambiar Password" class="boton_enviar" onclick="modificar_pass_usuario()">
						</center>	
					</td>
				</tr>
			</table>
			</center>
		</form>
	</div>
	
	<br><br><br>
	<div class="footer center">
		Copyright 2015 - Reservados todos los derechos <br>
		<a href="http://www.google.com.co">www.jonas.com.co</a>
	</div>
<!-- Hasta aqui el div que tiene el formulario principal -->
</body>
</html>