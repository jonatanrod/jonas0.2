<?php 
	session_start();
//	var_dump($_SESSION);
	$perfil=$_SESSION['perfil'];
	$usuario=$_SESSION['nombre'];
    //$pw=$_SESSION['pass'];
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
<!-- Desde aqui el div que tiene el formulario principal -->
	<div class="center" id="logo">
		<img src="imagenes/logo5.png" width="100" alt="Jonas SGD" title="Logo Jonas">	
		<h1 style="margin-top:-10px;">Cambiar Contraseña </h1><br>
		<form action="javascript:cambio_pass()" method="post" id="envia_pass">
			<span>
			<?php 
				echo "<h2>$usuario</h2>";		
	 		?>
	 		</span>

	 		<input type="text" id="pass1" name="pass1" class="input_corto" autofocus=autofocus>
				<br>
			<input type="text" id="pass2" name="pass2" class="input_corto">
				<br>

			<div id="desplegable_resultados"></div>
		</form>
	</div>
	

	<div class="footer center">
		Copyright 2015 - Reservados todos los derechos <br>
		<a href="http://www.google.com.co">www.jonas.com.co</a>
	</div>
<!-- Hasta aqui el div que tiene el formulario principal -->
</body>
</html>