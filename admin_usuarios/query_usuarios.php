<!DOCTYPE html>
<head>
	<meta charset="UTF-8">
	<title>Query de Usuarios</title>
	<script type="text/javascript" src="../include/js/jquery.js"></script>
	<script type="text/javascript" src="../include/js/funciones_usuarios.js"></script>
</head>
<body>
<?php 
	require_once('../include/genera_fecha.php');
	require_once('../login/conexion2.php');

	if(isset($_POST['identificacion'])){
		$identificacion=$_POST['identificacion'];
	}
	if(isset($_POST['nombre_completo'])){
		$nombre_completo=$_POST['nombre_completo'];
	}
	if(isset($_POST['login'])){
		$login=$_POST['login'];
	}
	if(isset($_POST['mail'])){
		$mail=$_POST['mail'];
	}
	if(isset($_POST['codigo_dependencia'])){
		$codigo_dependencia=$_POST['codigo_dependencia'];	
	}
	if(isset($_POST['dependencia'])){
		$dependencia=$_POST['dependencia'];	
	}
	if(isset($_POST['perfil'])){
		$perfil=$_POST['perfil'];
	}
	if(isset($_POST['ubicacion'])){
		$ubicacion=$_POST['ubicacion'];	
	}
	if(isset($_POST['estado'])){
		$estado=$_POST['estado'];	
	}
	if(isset($_POST['usuario_nuevo'])){
		$usuario_nuevo=$_POST['usuario_nuevo'];	
	}
	if(isset($_POST['nivel_seguridad'])){
		$nivel_seguridad=$_POST['nivel_seguridad'];	
	}
	if(isset($_POST['ventanilla_radicacion'])){
		$ventanilla_radicacion=$_POST['ventanilla_radicacion'];	
	}
	if(isset($_POST['tipo_formulario'])){	
		$tipo_formulario=$_POST['tipo_formulario'];
	}
	if(isset($_POST['mod_id_usuario'])){	
		$mod_id_usuario=$_POST['mod_id_usuario'];
	}
	if(isset($_POST['mod_identificacion'])){	
		$mod_identificacion=$_POST['mod_identificacion'];
	}
	if(isset($_POST['mod_nombre_completo'])){	
		$mod_nombre_completo=$_POST['mod_nombre_completo'];
	}
	if(isset($_POST['mod_login'])){	
		$mod_login=$_POST['mod_login'];
	}
	if(isset($_POST['mod_mail'])){	
		$mod_mail=$_POST['mod_mail'];
	}
	if(isset($_POST['mod_codigo_dependencia'])){	
		$mod_codigo_dependencia=$_POST['mod_codigo_dependencia'];
	}
	if(isset($_POST['mod_perfil'])){	
		$mod_perfil=$_POST['mod_perfil'];
	}
	if(isset($_POST['mod_estado'])){	
		$mod_estado=$_POST['mod_estado'];
	}
	if(isset($_POST['mod_usuario_nuevo'])){	
		$mod_usuario_nuevo=$_POST['mod_usuario_nuevo'];
	}
	if(isset($_POST['mod_nivel_seguridad'])){	
		$mod_nivel_seguridad=$_POST['mod_nivel_seguridad'];
	}
	if(isset($_POST['mod_ventanilla_radicacion'])){	
		$mod_ventanilla_radicacion=$_POST['mod_ventanilla_radicacion'];
	}

//var_dump($_POST);
	switch ($tipo_formulario) {
		case 'crear_usuario':
			$target_file= basename($_FILES["imagen"]["name"]);
			$path_foto="imagenes/fotos_usuarios/".basename($_FILES["imagen"]["name"]);

			$mover_a= "imagen";
			break;
		case 'modificar_usuario':
			$target_file= basename($_FILES["imagen2"]["name"]);
			$path_foto="imagenes/fotos_usuarios/".basename($_FILES["imagen2"]["name"]);

			$mover_a="imagen2";
			break;
		
		default:
			# code...
			break;
	}
	$query_max_usuario="select max(id_usuario) from usuarios";

	$fila_usuario = pg_query($conectado,$query_max_usuario);
	$linea = pg_fetch_array($fila_usuario);

	$max_usuario = $linea[0];
	$max_usuario2= $max_usuario+1;

	if($_FILES){ // Para carga de archivos ver README

		$target_dir="../imagenes/fotos_usuarios/";
		// echo "El tamaño maximo del archivo es ".ini_get('upload_max_filesize');// Este es el maximo tamaño permitido en php.ini -> upload_max_filesize
;	
		if(move_uploaded_file($_FILES["$mover_a"]["tmp_name"],$target_dir.$target_file)){

			if($tipo_formulario=='crear_usuario'){
				$query_usuario="insert into usuarios (perfil, codigo_dependencia, login, pass, estado, nombre_completo,
				usuario_nuevo, documento_usuario, nivel_seguridad, mail_usuario, id_usuario, path_foto, 
				ventanilla_radicacion )
				VALUES('$perfil','$codigo_dependencia','$login',md5('123'),'$estado','$nombre_completo', '$usuario_nuevo',
				'$identificacion','$nivel_seguridad','$mail','$max_usuario2','$path_foto', '$ventanilla_radicacion')";
			}elseif ($tipo_formulario=='modificar_usuario') { 
				$query_usuario="update usuarios set perfil='$mod_perfil', codigo_dependencia='$mod_codigo_dependencia', 
				login='$mod_login', estado='$mod_estado', nombre_completo='$mod_nombre_completo', 
				usuario_nuevo='$mod_usuario_nuevo',	documento_usuario='$mod_identificacion', 
				nivel_seguridad='$mod_nivel_seguridad',	mail_usuario='$mod_mail', path_foto='$path_foto', 
				ventanilla_radicacion='$mod_ventanilla_radicacion'
				where id_usuario ='$mod_id_usuario'";

				$login=$mod_login;	
			}else{
				echo "<script>
					alert('El formulario para crear/modificar usuario no se pudo enviar.')
				</script>";
			}

		}else{
			if($tipo_formulario=='crear_usuario'){
					$query_usuario="insert into usuarios (perfil, codigo_dependencia, login, 
					pass, estado, nombre_completo, usuario_nuevo, documento_usuario, nivel_seguridad, 
					mail_usuario, id_usuario, ventanilla_radicacion )
					VALUES('$perfil','$codigo_dependencia','$login',md5('123'),'$estado','$nombre_completo',
					'$usuario_nuevo','$identificacion','$nivel_seguridad','$mail','$max_usuario2',
					'$ventanilla_radicacion')";
				}elseif ($tipo_formulario=='modificar_usuario') {
					$query_usuario="update usuarios set perfil='$mod_perfil', 
					codigo_dependencia='$mod_codigo_dependencia', login='$mod_login', estado='$mod_estado', 
					nombre_completo='$mod_nombre_completo', usuario_nuevo='$mod_usuario_nuevo',			 
					documento_usuario='$mod_identificacion', nivel_seguridad='$mod_nivel_seguridad',
					mail_usuario='$mod_mail', ventanilla_radicacion='$mod_ventanilla_radicacion'
					where id_usuario ='$mod_id_usuario'";

					$login=$mod_login;
				}else{
					echo "<script>
						alert('El formulario para crear/modificar usuario no se pudo enviar.')
					</script>";
				}
		}
		if(pg_query($conectado,$query_usuario)){
			echo "<script> 
				auditoria('$tipo_formulario','$login');	
			</script>";
			
		}else{
			echo "<script>
				alert('No se pudo crear / actualizar el usuario');
				volver();
			</script>";
		}
	}
?>
</body>