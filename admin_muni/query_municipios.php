<!DOCTYPE html>
<head>
	<meta charset="UTF-8">
	<title>Query de Municipios</title>
	<script type="text/javascript" src="../include/js/jquery.js"></script>
	<script type="text/javascript" src="../include/js/funciones_municipios.js"></script>
</head>
<body>
	<?php 
		session_start();
		$usuario=$_SESSION['login'];
//var_dump($usuario);
	/*	$usuario = 'Jonas';/*Este es el usuario que esta realizando la modificacion.
		Por definir como lo voy a recuperar.*/

		require_once('../login/conexion2.php');
	
/*Aqui defino la fecha de la transaccion*/
//		include "../include/genera_fecha.php";
		$fecha_modificacion = date('Y-m-d G:i:s');
//var_dump($fecha_modificacion);
//		$fecha_modificacion = $date;//$date es del formato "2016-05-15"
//		$tipo_formulario=$_POST['tipo_formulario']; // Recibe tipo de formulario desde la que invoca el archivo 

/*switch para asignar el codigo del continente requerido en la base de datos*/
		if(isset($_POST['mod_continente'])){
			$continente = strtoupper($_POST['mod_continente']);
			switch ($continente) {
				case 'AMERICA':
					$id_continente=1;
					break;
				case 'ASIA':
					$id_continente=2;
					break;	
				case 'AFRICA':
					$id_continente=3;
					break;
				case 'EUROPA':
					$id_continente=4;
					break;	
				case 'OCEANIA':
					$id_continente=5;
					break;	
				default:
					$id_continente=1;
					break;
			}
		}
/* Fin switch para asignar el codigo del continente requerido en la base de datos*/	

/*Con este isset me aseguro que reciba todas las variables para la modificación de municipios.*/
		if(isset($_POST['mod_continente']) && isset($_POST['mod_pais']) && isset($_POST['mod_departamento']) && isset($_POST['mod_municipio'])){
			$tipo_formulario='modificar_municipio';
			
			$query="update municipios set nombre_continente='".$_POST['mod_continente']."', nombre_pais='".$_POST['mod_pais']."', 
			nombre_departamento='".$_POST['mod_departamento']."', nombre_municipio='".$_POST['mod_municipio']."' , 
			creador_municipio='$usuario', fecha_creacion='$fecha_modificacion' where nombre_continente='".$_POST['ant_continente']."' 
			and nombre_pais ='".$_POST['ant_pais']."' and nombre_departamento='".$_POST['ant_departamento']."' 
			and nombre_municipio='".$_POST['ant_municipio']."';";


		}elseif(isset($_POST['continente']) && isset($_POST['pais']) && isset($_POST['departamento']) && isset($_POST['municipio'])){
			$tipo_formulario='crear_municipio';
			$municipio=$_POST['municipio'];
			$departamento=$_POST['departamento'];
			$pais=$_POST['pais'];

			switch ($_POST['continente']) {
				case 'AMERICA':
					$id_continente=1;
					break;
				case 'ASIA':
					$id_continente=2;
					break;	
				case 'AFRICA':
					$id_continente=3;
					break;
				case 'EUROPA':
					$id_continente=4;
					break;	
				case 'OCEANIA':
					$id_continente=5;
					break;	
				default:
					$id_continente=1;
					break;
			}
			$creado="municipio $municipio, departamento $departamento, pais $pais";
			$query ="INSERT INTO municipios (id_continente, nombre_continente, nombre_pais,	nombre_departamento, 
			nombre_municipio, fecha_creacion, creador_municipio) VALUES 
			($id_continente, '".$_POST['continente']."', '$pais','$departamento','$municipio','$fecha_modificacion','$usuario');";

		}	
	
		if(pg_query($conectado,$query)){
			echo "<script> 
				alert('$creado')
					auditoria('$tipo_formulario','$creado');	
				</script>";
		}else{
			echo "<script> Ocurrió un error al realizar la consulta, por favor revisa e intenta nuevamente.</script>";
		}
	?>
</body>
</html>
