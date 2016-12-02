<!DOCTYPE html>
<head>
	<meta charset="UTF-8">
	<title>Buscador de remitente</title>
	
	<script type="text/javascript">
		function volver(){ // Función para mostrar nuevamente principal3.php
			window.location.href='../principal3.php'
		}
	</script>		
</head>
<body>
	<?php 
	require_once('../login/conexion.php');

 /*Aqui defino la fecha de la transaccion*/
	//include "../include/genera_fecha.php";
	//$k = date(timepstamp);
	$usuario = 'Jonas';//Por definir como lo voy a recuperar (Sesion ?).
	//$fecha_modificacion = $fecha_hoy;//$fecha_hoy es del formato "Jueves 28 de Enero de 2016"
	//echo "$fecha_modificacion <br>".$_POST['tipo_formulario']."<br>kjhg <br>";
		$nombre_contacto=$_POST['nombre_contacto'];
		$nit_contacto=$_POST['nit_contacto'];
		$ubicacion_contacto=$_POST['ubicacion_contacto'];
		$direccion_contacto=$_POST['direccion_contacto'];
		$telefono_contacto=$_POST['telefono_contacto'];
		$email_contacto=$_POST['email_contacto'];
				$representante_legal=$_POST['representante_legal'];

	if($_POST['tipo_formulario'] === 'agregar_nuevo_contacto'){
				$dignatario=$_POST['representante_legal_contacto'];
				
				//$query ="INSERT INTO contactos VALUES ('3', '$nombre_contacto', '$nit_contacto', '$ubicacion_contacto', '$direccion_contacto', '$telefono_contacto', '$email_contacto', '$dignatario', '$usuario', '$fecha_modificacion');";
					$query_verifica="SELECT * FROM contactos where nombre_contacto='$nombre_contacto' limit 10";

					if($fila1=pg_query($conectado,$query_verifica)){
						if($row=pg_fetch_array($fila1)){
							$registros= pg_num_rows($fila1);

							if($registros>0){
								echo "<script> alert('El contacto ".$row['nombre_contacto']." ha sido creado correctamente') 
									volver();
								</script>";				
							}else{
								echo "<script> alert('El contacto NO se pudo crear. Revise los campos del formulario e intente nuevamente por favor.') 
									volver();
								</script>";
							}
						}
					}	
				  
	}elseif($_POST['tipo_formulario'] ==='modificar_contacto'){
				

				$ant_nombre_contacto=$_POST['ant_nombre_contacto'];
				$ant_nit_contacto=$_POST['ant_nit_contacto'];
				$ant_ubicacion_contacto=$_POST['ant_ubicacion_contacto'];
				$ant_direccion_contacto=$_POST['ant_direccion_contacto'];
				$ant_telefono_contacto=$_POST['ant_telefono_contacto'];
				$ant_email_contacto=$_POST['ant_email_contacto'];
				$ant_dignatario=$_POST['ant_representante_legal'];				

				$query ="update contactos set nombre_contacto = '$nombre_contacto', nit_contacto='$nit_contacto', ubicacion_contacto='$ubicacion_contacto',
				direccion_contacto='$direccion_contacto', telefono_contacto='$telefono_contacto', mail_contacto='$email_contacto', representante_legal='$representante_legal' 
				WHERE nombre_contacto='$ant_nombre_contacto' AND nit_contacto='$ant_nit_contacto' AND ubicacion_contacto='$ant_ubicacion_contacto' 
				AND direccion_contacto='$ant_direccion_contacto';";

				
				if($fila=pg_query($conectado,$query)){
					$query_verifica="SELECT * FROM contactos where nombre_contacto='$nombre_contacto'";

					if($fila1=pg_query($conectado,$query_verifica)){
						if($row=pg_fetch_array($fila1)){
							$registros= pg_num_rows($fila1);

							if($registros>0){
								/*echo "<script> alert('El contacto ".$row['nombre_contacto']." ha sido modificado correctamente') 
									volver();
								</script>";	*/
								echo "string";			
							}else{
								echo "<script> alert('El contacto NO SE PUDO CREAR. Revise los campos del formulario e intente nuevamente por favor.') 
									volver();
								</script>";
							}
						}
					}	
				}else{
					echo "<script> Ocurrió un error al realizar la consulta, por favor revisa e intenta nuevamente.</script>";
				}  
				/*	echo "<script> alert('El contacto SI se puuuuuede modificar.') 
						volver();
					</script>";
				*/
			}else{
				echo "Las variables enviadas no están completas por lo que no se puede realizar la modificación a la base de datos. Revise por favor e intente nuevamente. <br> <button onclick='volver()'>Volver</button> ";
			}
		    
	?>
</body>		