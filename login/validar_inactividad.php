<?php 
session_start();

$fecha_antigua=$_SESSION["ultimo_ingreso"];
$nuevo=trim($_SESSION['usuario_nuevo']);
//var_dump($_SESSION);
if ($nuevo=="SI") {
	echo '
	<script language=javascript>
		alert("Por seguridad de su cuenta, Se requiere cambio de contraseña.");
		$("#contenido").load("login/cambio_contrasena.php");
	</script>';
}

$hora=date("Y-n-j H:i:s");

$tiempo=(strtotime($hora)-strtotime($fecha_antigua));
$operacion=60*15;/* Este es el tiempo para que la sesion se inactive automaticamente.
	Es decir, 60 (segundos) por la cantidad de minutos que quiera la inactividad */

	if($tiempo>=$operacion){
		//session_destroy();
		//session_unset();
?>		
		<script language=javascript>
			$.ajax({	// Guardo registro de ingreso al sistema para auditoria
				type: 'POST',
				url: 'login/transacciones.php',
				data: {
					'transaccion' : 'cerrar_sesion_inactividad'	
				},			
				success: function(resp1){
					if(resp1=="true"){
						alert("Por su seguridad, su sesión ha sido caducada. Por favor ingrese nuevamente.")
						self.location="index.php"
					}else{
						alert(resp1)
					}
				}
			})	
		</script>';
<?php			
	}else{
		$_SESSION["ultimo_ingreso"]=$hora;
	}
?>