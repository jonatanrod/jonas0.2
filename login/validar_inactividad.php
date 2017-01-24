<?php 
session_start();

$fecha_antigua=$_SESSION["ultimo_ingreso"];
$nuevo=$_SESSION['usuario_nuevo'];
var_dump($nuevo);
echo "<script>alert('jjjjjjjjjjjjjj')";
if ($nuevo="SI ") {
	echo '<script language=javascript>
				alert("Por su seguridad, Se requiere cambio de contraseña.");
				$("#contenido").load("login/cambio_contrasena.php");
			</script>';
}

$hora=date("Y-n-j H:i:s");

$tiempo=(strtotime($hora)-strtotime($fecha_antigua));
$operacion=60*15;/* Este es el tiempo para que la sesion se inactive automaticamente.
	Es decir, 60 (segundos) por la cantidad de minutos que quiera la inactividad */

	if($tiempo>=$operacion){
		session_destroy();
		session_unset();
		echo '<script language=javascript>
				alert("Por su seguridad, su sesión ha sido caducada. Por favor ingrese nuevamente.")
				self.location="index.php"
			</script>';
	}else{
		$_SESSION["ultimo_ingreso"]=$hora;
	}
?>