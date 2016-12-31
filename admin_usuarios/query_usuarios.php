<!DOCTYPE html>
<head>
	<meta charset="UTF-8">
	<title>Query de Municipios</title>

	<script type="text/javascript">
		function volver(){
			window.location.href='../principal3.php'
		}
	</script>
</head>
<body>
<?php 
	require_once('../include/genera_fecha.php');
	require_once('../login/conexion2.php');

//	$identificacion="";
//	$nombre_completo="";

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

	$query_max_usuario="select max(id_usuario) from usuarios";

	$fila_usuario = pg_query($conectado,$query_max_usuario);
	$linea = pg_fetch_array($fila_usuario);

	$max_usuario = $linea[0];
	$max_usuario2= $max_usuario+1;

	if($_FILES){ // Para carga de archivos ver README

		$target_dir="../imagenes/fotos_usuarios/";
		// echo "El tamaño maximo del archivo es ".ini_get('upload_max_filesize');// Este es el maximo tamaño permitido en php.ini -> upload_max_filesize

		$target_file= basename($_FILES["imagen"]["name"]);
		$path_foto="imagenes/fotos_usuarios/".basename($_FILES["imagen"]["name"]);

		$fecha_sesion=date("Y-m-d H:i:s");
			
		if(move_uploaded_file($_FILES["imagen"]["tmp_name"],$target_dir.$target_file)){

				if($tipo_formulario=='crear_usuario'){
					$query_usuario="insert into usuarios (perfil, codigo_dependencia, login, 
					pass, estado, nombre_completo, usuario_nuevo, documento_usuario, sesion, 
					fecha_sesion, nivel_seguridad, mail_usuario, id_usuario, path_foto,
					ventanilla_radicacion )
					VALUES('$perfil','$codigo_dependencia','$login','123','$estado',
					'$nombre_completo','$usuario_nuevo','$identificacion','Sesion_inicio',
					'$fecha_sesion','$nivel_seguridad','$mail','$max_usuario2','$path_foto',
					'$ventanilla_radicacion')";
				}elseif ($tipo_formulario=='modificar_usuario') {
					$query_usuario="update usuarios set documento_usuario='".$mod_identificacion."',
					nombre_completo='".$mod_nombre_completo."', login='".$mod_login."', 
					mail_usuario='".$mod_mail."', codigo_dependencia='".$mod_codigo_dependencia."',
					perfil='".$mod_perfil."', 
					path_foto='".$path_foto."', estado='".$mod_estado."', 
					usuario_nuevo='".$mod_usuario_nuevo."' , 
					nivel_seguridad='".$mod_nivel_seguridad."' , 
					ventanilla_radicacion='".$mod_ventanilla_radicacion."'
					where id_usuario ='".$mod_id_usuario."'";
				}else{
					echo "<script>
						alert('El formulario para crear/modificar usuario no se pudo enviar.')
					</script>";
				}
		
		}else{
			if($tipo_formulario=='crear_usuario'){
					$query_usuario="insert into usuarios (perfil, codigo_dependencia, login, 
					pass, estado, nombre_completo, usuario_nuevo, documento_usuario, sesion, 
					fecha_sesion, nivel_seguridad, mail_usuario, id_usuario, path_foto,
					ventanilla_radicacion )
					VALUES('$perfil','$codigo_dependencia','$login','123','$estado',
					'$nombre_completo','$usuario_nuevo','$identificacion','Sesion_inicio',
					'$fecha_sesion','$nivel_seguridad','$mail','$max_usuario2','$path_foto',
					'$ventanilla_radicacion')";
				}elseif ($tipo_formulario=='modificar_usuario') {
					$query_usuario="update usuarios set documento_usuario='".$mod_identificacion."',
					nombre_completo='".$mod_nombre_completo."', login='".$mod_login."', 
					mail_usuario='".$mod_mail."', codigo_dependencia='".$mod_codigo_dependencia."',
					perfil='".$mod_perfil."', estado='".$mod_estado."', 
					usuario_nuevo='".$mod_usuario_nuevo."' , 
					nivel_seguridad='".$mod_nivel_seguridad."' , 
					ventanilla_radicacion='".$mod_ventanilla_radicacion."'
					where id_usuario ='".$mod_id_usuario."'";
				}else{
					echo "<script>
						alert('El formulario para crear/modificar usuario no se pudo enviar.')
					</script>";
				}
		}
			$fila_usuario = pg_query($conectado,$query_usuario);
			echo "<script> alert('El Usuario ha sido creado / modificado correctamente') 
					volver();
			</script>";
	}

?>
</body>