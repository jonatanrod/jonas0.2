<!-- Este archivo recibe los formularios de index_dependencias.php y realiza las consultas dependiendo del formulario -->

<!DOCTYPE html>
<head>
	<meta charset="UTF-8">
	<title>Buscador de Dependencias</title>
	<script type="text/javascript" src="../include/js/jquery.js"></script>
	<script type="text/javascript" src="../include/js/funciones_dependencias.js"></script>
</head>
<body>
<?php   
	session_start();
//	var_dump($_SESSION);
	$usuario=$_SESSION['login'];

	require_once('../login/conexion2.php');
	
	if(isset($_POST['tipo_formulario'])){ // Desde index_dependencias.php
		$tipo_formulario=$_POST['tipo_formulario'];
		if ($tipo_formulario=='crear_dependencia') { // Valor desde index_dependencias.php

				$codigo_dependencia=$_POST['codigo_dependencia'];
				$nombre_dependencia=$_POST['nombre_dependencia'];
				$dependencia_padre=$_POST['dependencia_padre'];
				$activa="SI"; // Si la dependencia la estoy creando, por defecto debe estar activa. No tiene sentido crear una dependencia inactiva.

				$query_insertar_dependencia="insert into dependencias(codigo_dependencia,nombre_dependencia, dependencia_padre, activa, creador_dependencia, fecha_modificacion)
				VALUES('$codigo_dependencia','$nombre_dependencia','$dependencia_padre','$activa','$usuario',current_timestamp)";

				if(pg_query($conectado,$query_insertar_dependencia)){
					echo "<script>
							auditoria('$tipo_formulario','$nombre_dependencia')
						</script>";
				}else{
					echo "<script> Ocurrió un error al realizar la creación de la dependencia, por favor revisa e intenta nuevamente.</script>";
				}

		}else if($tipo_formulario=='modificar_dependencia'){ // Formulario de Modificación Dependencias desde index_dependencias.php

			$id_dependencia=$_POST['id_dependencia'];
			$mod_codigo_dependencia=$_POST['mod_codigo_dependencia'];
			$antiguo_codigo=$_POST['antiguo_codigo'];
			$antiguo_nombre_dependencia=$_POST['antiguo_nombre_dependencia'];
			$mod_nombre_dependencia=$_POST['mod_nombre_dependencia'];
			$mod_dependencia_padre=$_POST['mod_dependencia_padre'];
			$mod_activa=$_POST['mod_activa'];

			$query_modificar_dependencia="UPDATE dependencias set codigo_dependencia='$mod_codigo_dependencia', nombre_dependencia='$mod_nombre_dependencia', dependencia_padre='$mod_dependencia_padre', activa='$mod_activa', creador_dependencia='$usuario', fecha_modificacion=current_timestamp where id_dependencia ='$id_dependencia'";
			$query_modificar_dependencias_padre="UPDATE dependencias set dependencia_padre='$mod_nombre_dependencia', fecha_modificacion= current_timestamp where dependencia_padre='$antiguo_nombre_dependencia'";
				if(pg_query($conectado,$query_modificar_dependencia)){

					if(pg_query($conectado,$query_modificar_dependencias_padre)){
						echo "<script> 
							auditoria('$tipo_formulario','$mod_nombre_dependencia');	
						</script>";
					}else{
						echo "<script> No se pudo actualizar las dependencias padre. Por favor revisa e intenta nuevamente.</script>";
					}
				}else{
					echo "<script> Ocurrió un error al realizar la modificación, por favor revisa e intenta nuevamente.</script>";
				}
		}else{
			echo "Error. No viene de un formulario definido.";
		}
	}
?>
</body>
</html>