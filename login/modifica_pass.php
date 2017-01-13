<?php 
	session_start();
	if(($_SESSION['nombre'])!=''){
		$nombre=$_SESSION['nombre'];
		
?>
<html>
<head>
	<meta charset="UTF-8">
	<title>Formulario para Modificar Usuarios</title>
	<link rel="stylesheet" type="text/css" href="include/css/estilos.css">
	<script type="text/javascript" src="include/js/jquery.js"></script>
	<script type="text/javascript" src="include/js/funciones.js"></script>
</head>

<script>
        function enviar(){
            window.location.href='../principal3.php';
        }
    </script>

<?php 

	$new_pass = $_POST['pass1'];

	$query="update usuarios set pass='$new_pass' where login='$nombre'";

	require_once("conexion2.php");

			$insertar = pg_query($query) or die("No se realizó la actualizacion");
			if ($insertar) {
				echo "<script>alert('Se ha actualizado la contraseña correctamente.'); enviar();</script>";
			}else{
				echo "<script>alert('No se ha actualizado la contraseña por favor revisar las variables.'); enviar();</script>";
			}
	
 ?>
</html>
<?php 
}else{
	header("Location:login.php");
}

 ?>