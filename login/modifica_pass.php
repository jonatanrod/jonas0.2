<?php 
	$new_pass = $_POST['pass'];

	echo "$new_pass";
/*
	$query="update usuarios set pass='$new_pass' where login='$nombre'";

	require_once("conexion2.php");

			$insertar = pg_query($query) or die("No se realizó la actualizacion");
			if ($insertar) {
				echo "<script>alert('Se ha actualizado la contraseña correctamente.'); enviar();</script>";
			}else{
				echo "<script>alert('No se ha actualizado la contraseña por favor revisar las variables.'); enviar();</script>";
			}	
	*/		
?>
