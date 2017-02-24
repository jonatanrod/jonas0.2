<?php 
	require_once('conexion3.php');
	session_start();
//	var_dump($_SESSION);

/* Genera ID **********************************************************************************/
	$query_max_log="select max(id) from auditoria_jonas";

	$fila_log = pg_query($conectado_log,$query_max_log);
	$linea_log = pg_fetch_array($fila_log);

	$max_log = $linea_log[0];
	$max_log2= $max_log+1;

/* Fin Genera ID ******************************************************************************/

/* Genera Usuario y transaccion ***************************************************************/
	$usuario=$_SESSION['login'];
	$nombre_completo = $_SESSION['nombre'];
	
	$transaccion=$_POST['transaccion'];

	switch ($transaccion) {
		case 'login':
			$guarda_transaccion="El usuario $usuario - $nombre_completo ha ingresado a Jonas.";
			break;
		case 'cambio_pass':
			$guarda_transaccion="Se ha cambiado el password del usuario $usuario - $nombre_completo.";
			$_SESSION['usuario_nuevo']='NO';
			break;
		case 'cerrar_sesion':
			$guarda_transaccion="El usuario $usuario - $nombre_completo ha salido del sistema.";
			break;	
		case 'cerrar_sesion_inactividad':
			$guarda_transaccion="Se ha cerrado sesion del usuario $usuario - $nombre_completo por timeout";
			break;	
		case 'crear_usuario':
			$creado=$_POST['creado'];
			$guarda_transaccion="El usuario $usuario - $nombre_completo ha creado al usuario nuevo $creado";
			break;	
		case 'modificar_usuario':
			$creado=$_POST['creado'];
			$guarda_transaccion="El usuario $usuario - $nombre_completo ha modificado al usuario $creado";
			break;
		case 'crear_dependencia':
			$creado=$_POST['creado'];
			$guarda_transaccion="El usuario $usuario - $nombre_completo ha creado la dependencia $creado";
			break;	
		case 'modificar_dependencia':
			$creado=$_POST['creado'];
			$guarda_transaccion="El usuario $usuario - $nombre_completo ha modificado la dependencia $creado";
			break;	
		case 'crear_municipio':
			$creado=$_POST['creado'];
			$guarda_transaccion="El usuario $usuario - $nombre_completo ha creado el municipio $creado";
			break;			
		default:
			# code...
			break;
	}
/* Fin genera Usuario y transaccion **********************************************************/	
/* Genera la fecha de transaccion ************************************************************/
	$timestamp = date('Y-m-d G:i:s');
/* Fin genera la fecha de transaccion ********************************************************/

/* Genera la IP ******************************************************************************/
/* Funcion que genera la ip del cliente para guardar cada vez que se realiza una transaccion */
    function getRealIP(){ 
        if (isset($_SERVER["HTTP_CLIENT_IP"])){

            return $_SERVER["HTTP_CLIENT_IP"];

        }elseif (isset($_SERVER["HTTP_X_FORWARDED_FOR"])){

            return $_SERVER["HTTP_X_FORWARDED_FOR"];

        }elseif (isset($_SERVER["HTTP_X_FORWARDED"])){

            return $_SERVER["HTTP_X_FORWARDED"];

        }elseif (isset($_SERVER["HTTP_FORWARDED_FOR"])){

            return $_SERVER["HTTP_FORWARDED_FOR"];

        }elseif (isset($_SERVER["HTTP_FORWARDED"])){

            return $_SERVER["HTTP_FORWARDED"];

        }else{
            return $_SERVER["REMOTE_ADDR"];
        }
    }
    $ip_equipo = getRealIP();
       
/* Genera la IP **********************************************************************************/
/* Fin funcion que genera la ip del cliente para guardar cada vez que se realiza una transaccion */
/* Funcion para verificar navegador***************************************************************/
$user_agent = $_SERVER['HTTP_USER_AGENT'];
function getBrowser($user_agent){
	if(strpos($user_agent, 'MSIE') !== FALSE)
	   return 'Internet explorer';
	 elseif(strpos($user_agent, 'Edge') !== FALSE) //Microsoft Edge
	   return 'Microsoft Edge';
	 elseif(strpos($user_agent, 'Trident') !== FALSE) //IE 11
	    return 'Internet explorer';
	 elseif(strpos($user_agent, 'Opera Mini') !== FALSE)
	   return "Opera Mini";
	 elseif(strpos($user_agent, 'Opera') || strpos($user_agent, 'OPR') !== FALSE)
	   return "Opera";
	 elseif(strpos($user_agent, 'Firefox') !== FALSE)
	   return 'Mozilla Firefox';
	 elseif(strpos($user_agent, 'Chrome') !== FALSE)
	   return 'Google Chrome';
	 elseif(strpos($user_agent, 'Safari') !== FALSE)
	   return "Safari";
	 else
	   return 'No hemos podido detectar su navegador';
}
$navegador = getBrowser($user_agent);
 
//echo "El navegador con el que estás visitando esta web es: ".$navegador;
/* Fin funcion para verificar navegador***********************************************************/

	$query_log="insert into auditoria_jonas (id,usuario,fecha,transaccion,ip,tipo_transaccion,navegador) values ($max_log2,'$usuario','$timestamp', '$guarda_transaccion','$ip_equipo','$transaccion','$navegador')";

	if(pg_query($conectado_log,$query_log)){
		echo "true";
	}else{
		echo "No se ha podido generar auditoria sobre la transaccion realizada. Por favor comuníquese con el administrador.";
	}

 ?>