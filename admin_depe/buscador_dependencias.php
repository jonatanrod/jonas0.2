<!DOCTYPE html>
<head>
	<meta charset="UTF-8">
	<title>Buscador de Dependencias</title>
</head>
<body>
	<?php
	/*Aqui defino la fecha para mostrar en formato "Jueves 05 de Mayo de 2016" */
		include "../include/genera_fecha.php";
	/*Fecha que se realiza la transaccion (hoy)*/	
		$fecha_modificacion = $date; // $date es del formato "2016-05-05"
 
		require_once('../login/conexion.php');
		//sleep(1);
		$permiso_administrador_dependencias = "SI";/*Falta por definir el permiso en usuarios.	Lo pongo temporalmente 1 pero hay que definirlo.*/
		if(isset($_POST['desde_formulario'])){
			$desde_formulario = 1; 
		}	
/* Isset ajax (buscador_dependencias) consulta sugerencias - buscador principal dependencias.*/	
		$search_depe ='';
		if(isset($_POST['search_depe'])){
			$search_depe = $_POST['search_depe'];

		$consulta = "SELECT * FROM dependencias WHERE UPPER(codigo_dependencia) LIKE UPPER('%".$search_depe."%') OR 
		UPPER(nombre_dependencia) LIKE UPPER('%".$search_depe."%') order by nombre_dependencia limit 10";
		$fila_depe = pg_query($conectado,$consulta);
	/*Calcula el numero de registros que genera la consulta anterior.*/
		$registros_depe= pg_num_rows($fila_depe);
	/*Recorre el array generado e imprime uno a uno los resultados.*/	

			if($registros_depe>0 && $search_depe!=''){
				do{
					$num_fila = 0; 
					for ($i=0;$i<$registros_depe;$i++){
						$linea = pg_fetch_array($fila_depe);

						$codigo_dependencia = $linea['codigo_dependencia'];
						$nombre_dependencia = $linea['nombre_dependencia'];
						$dependencia_padre = $linea['dependencia_padre'];
						$activa = $linea['activa'];
						$creador_dependencia=$linea['creador_dependencia'];
						$fecha_creacion_dependencia=$linea['fecha_modificacion'];
						/* Aqui modifico la fecha para que quede con el para mostrar en formato "Jueves 05 de Mayo de 2016"*/
						$fecha_creacion_depe=$b->traducefecha($fecha_creacion_dependencia);	
						$id_dependencia=$linea['id_dependencia'];					
						
						echo "<div class='art";
							if ($num_fila%2==0) echo " fila2"; //si el resto de la división es 0 pongo un color
							else echo " fila1"; //si el resto de la división NO es 0 pongo otro color 

						echo "'>"; 
   
						/*Aqui defino cuál va a ser el comportamiento al dar clic sobre el resultado obtenido desde el "a href"*/;
							if($desde_formulario===1){
								echo "<a href=\"javascript:cargar_modifica_dependencia('$codigo_dependencia','$nombre_dependencia','$dependencia_padre','$activa','$id_dependencia')\">";
							}else{
								echo "<a href=\"#\"> <script> alert('No, no hay Ahora formulario_nueva_dependencia es '+'$desde_formulario');</script>";
							}
			
						/*Aqui defino cuál va a ser el comportamiento al dar click sobre el 
						resultado obtenido*/			
							echo " (".$codigo_dependencia.") ".
								 $nombre_dependencia." | ";
							echo "<span>Dependencia Padre ( ".$dependencia_padre." ) | Activa -".$activa." "."</span>";
							echo "<span class='ver_creador'> | Creado por ".$creador_dependencia." (".
								 $fecha_creacion_depe.")</span>";
							echo "</a>";
					/*Hasta aqui debe ir la etiqueta "a href" para que cuando haga clic en cada uno de los resultados*/
						echo "</div>";//cierra div class='art'
						$num_fila++; 
					}
				}while ($fila_depe=pg_fetch_assoc($fila_depe));
			}else{
				if($permiso_administrador_dependencias=="SI"){
					echo "<h2> No se han encontrado resultados</h2><p>Si desea ingresar una nueva dependencia haga click 
					<a href='javascript:abrirVentanaCrearDependencia();'>aqui</a></p>";
				}else{
					echo"<script>$('#error_ubicacion_dependencia').slideDown('slow');</script>";
				}
				
			}
		}	
/* Fin isset ajax (buscador_dependencias) consulta sugerencias - buscador principal dependencias.*/	

/* Isset ajax (buscador_codigo_dependencias) consulta sugerencias - codigo dependencia -  Formulario de Agregar Dependencia */	
		$search_codi_depe ='';
		if(isset($_POST['search_codi_depe'])){
			$search_codi_depe = $_POST['search_codi_depe'];

		$consulta_codi_depe = "SELECT * FROM dependencias WHERE UPPER(codigo_dependencia)
		LIKE UPPER('%".$search_codi_depe."%') and activa ='SI' order by nombre_dependencia limit 5";
		$fila_codi_depe = pg_query($conectado,$consulta_codi_depe);
	/*Calcula el numero de registros que genera la consulta anterior.*/
		$registros_codi_depe= pg_num_rows($fila_codi_depe);
	/*Recorre el array generado e imprime uno a uno los resultados.*/	

			if($registros_codi_depe>0 && $search_codi_depe!=''){
				do{
					for ($i=0;$i<$registros_codi_depe;$i++){
						$linea_depe = pg_fetch_array($fila_codi_depe);

						$id_dependencia = $linea_depe['id_dependencia'];
						$codigo_dependencia = $linea_depe['codigo_dependencia'];
						$nombre_dependencia = $linea_depe['nombre_dependencia'];
						$dependencia_padre = $linea_depe['dependencia_padre'];
						$activa = $linea_depe['activa'];
						$creador_dependencia=$linea_depe['creador_dependencia'];
						$fecha_modificacion_dependencia=$linea_depe['fecha_modificacion'];
		/* Aqui modifico la fecha para que quede con el para mostrar en formato "Jueves 05 de Mayo de 2016"*/
						$fecha_modificacion_depe=$b->traducefecha($fecha_modificacion_dependencia);	
												
						echo "<div class='art1'>";
						/*Aqui defino cuál va a ser el comportamiento al dar clic sobre el resultado obtenido desde el "a href"*/;
							if($desde_formulario===1){
								echo "<a href=\"javascript:cargar_modifica_dependencia('$codigo_dependencia','$nombre_dependencia','$dependencia_padre','$activa','$id_dependencia')\" title='Modificar Dependencia'>";
							}else{
								echo "<a href=\"#\"> <script> alert('No, no hay Ahora formulario_nueva_dependencia es '+'$desde_formulario');</script>";
							}
			
						/*Aqui defino cuál va a ser el comportamiento al dar click sobre el 
						resultado obtenido*/			
							echo " (".$codigo_dependencia.") ".
								 $nombre_dependencia." | ";
							echo "<span>Dependencia Padre ( ".$dependencia_padre." ) | Activa -".$activa." "."</span>";
							echo "<span class='ver_creador'> | Creado por ".$creador_dependencia." (".
								 $fecha_modificacion_depe.")</span>";
							echo "</a>";
					/*Hasta aqui debe ir la etiqueta "a href" para que cuando haga clic en cada uno de los resultados*/
						echo "</div>";//cierra div class='art'
					}
				}while ($fila_depe=pg_fetch_assoc($fila_codi_depe));
			}else{
				echo "<script>
					$('#codigo_dependencia_ya_existe').slideUp('slow');
					$('#error_codigo_dependencia').slideUp('slow');
				</script>";
			}
		}
/* Fin isset ajax (buscador_codigo_dependencias) consulta sugerencias - codigo dependencia -  Formulario de Agregar Dependencia */

/* Isset ajax (buscador_nombre_dependencias) consulta sugerencias - nombre dependencia -  Formulario Agregar Dependencia */	
		$search_nom_depe ='';
		if(isset($_POST['search_nom_depe'])){
			$search_nom_depe = $_POST['search_nom_depe'];

		$consulta_nom_depe = "SELECT * FROM dependencias WHERE UPPER(codigo_dependencia)
		LIKE UPPER('%".$search_nom_depe."%') OR UPPER(nombre_dependencia) 
		LIKE UPPER('%".$search_nom_depe."%') and activa ='SI' order by nombre_dependencia limit 5";

		$fila_nom_depe = pg_query($conectado,$consulta_nom_depe);
	/*Calcula el numero de registros que genera la consulta anterior.*/
		$registros_nom_depe= pg_num_rows($fila_nom_depe);
	/*Recorre el array generado e imprime uno a uno los resultados.*/	

			if($registros_nom_depe>0 && $search_nom_depe!=''){
				do{
					for ($i=0;$i<$registros_nom_depe;$i++){
						$linea_nom_depe = pg_fetch_array($fila_nom_depe);

						$id_nom_dependencia = $linea_nom_depe['id_dependencia'];
						$codigo_nom_dependencia = $linea_nom_depe['codigo_dependencia'];
						$nombre_nom_dependencia = $linea_nom_depe['nombre_dependencia'];
						$dependencia_nom_padre = $linea_nom_depe['dependencia_padre'];
						$activa_nom = "SI";
						$creador_nom_dependencia=$linea_nom_depe['creador_dependencia'];
						$fecha_nom_modificacion_dependencia=$linea_nom_depe['fecha_modificacion'];
	/* Aqui modifico la fecha para que quede con el para mostrar en formato "Jueves 05 de Mayo de 2016"*/
						$fecha_nom_modificacion_depe=$b->traducefecha($fecha_nom_modificacion_dependencia);	
										
						echo "<div class='art2'>";
						/*Aqui defino cuál va a ser el comportamiento al dar clic sobre el resultado obtenido desde el "a href"*/;
							if($desde_formulario===1){
								echo "<a href=\"javascript:cargar_modifica_dependencia('$codigo_nom_dependencia','$nombre_nom_dependencia','$dependencia_nom_padre','$activa_nom','$id_nom_dependencia')\" title='Modificar Dependencia'>";
							}else{
								echo "<a href=\"#\"> <script> alert('No, no hay Ahora formulario_nueva_dependencia es '+'$desde_formulario');</script>";
							}
						/*Aqui defino cuál va a ser el comportamiento al dar click sobre el 
						resultado obtenido*/			
							echo " (".$codigo_nom_dependencia.") ".
								 $nombre_nom_dependencia." | ";
							echo "<span>Dependencia Padre ( ".$dependencia_nom_padre." ) | Activa -".$activa_nom." "."</span>";
							echo "<span class='ver_creador'> | Creado por ".$creador_nom_dependencia." (".
								 $fecha_nom_modificacion_depe.")</span>";
							echo "</a>";
					/*Hasta aqui debe ir la etiqueta "a href" para que cuando haga clic en cada uno de los resultados*/
						echo "</div>";//cierra div class='art'
					}
				}while ($fila_depe=pg_fetch_assoc($fila_nom_depe));
			}else{
				echo "<script>
					$('#error_nombre_dependencia').slideUp('slow');
					$('#nombre_dependencia_ya_existe').slideUp('slow');
				</script>";
			}
		}
/* Fin isset ajax (buscador_nombre_dependencias) consulta sugerencias - nombre dependencia -  Formulario Agregar Dependencia */	
	
/* Isset ajax (buscador_dependencia_padre) consulta sugerencias - nombre de dependencia padre - Formulario Agregar Dependencia */	

		$search_depe_padre ='';
		if(isset($_POST['search_depe_padre'])){
			$search_depe_padre = $_POST['search_depe_padre'];
		
		$consulta_depe_padre = "SELECT * FROM dependencias WHERE UPPER(codigo_dependencia) 
		LIKE UPPER('%".$search_depe_padre."') OR UPPER(nombre_dependencia)
		LIKE UPPER('%".$search_depe_padre."%') and activa ='SI' order by nombre_dependencia limit 5";

		$fila_depe_padre = pg_query($conectado,$consulta_depe_padre);
	/*Calcula el numero de registros que genera la consulta anterior.*/
		$registros_codi_padre= pg_num_rows($fila_depe_padre);
	/*Recorre el array generado e imprime uno a uno los resultados.*/	

			if($registros_codi_padre>0 && $search_depe_padre!=''){

				echo "<script>$('#error_nombre_dependencia_padre').slideUp('slow');</script>";

				do{
					for ($i=0;$i<$registros_codi_padre;$i++){
						$linea_depe_padre = pg_fetch_array($fila_depe_padre);

						$id_dependencia_padre = $linea_depe_padre['id_dependencia'];
						$codigo_dependencia_padre = $linea_depe_padre['codigo_dependencia'];
						$nombre_dependencia_padre = $linea_depe_padre['nombre_dependencia'];
						$dependencia_padre_padre = $linea_depe_padre['dependencia_padre'];
						$activa_padre = $linea_depe_padre['activa'];
						$creador_dependencia_padre=$linea_depe_padre['creador_dependencia'];
						$fecha_modificacion_dependencia_padre=$linea_depe_padre['fecha_modificacion'];
		/* Aqui modifico la fecha para que quede con el para mostrar en formato "Jueves 05 de Mayo de 2016"*/
						$fecha_modificacion_depe_padre=$b->traducefecha($fecha_modificacion_dependencia_padre);	
												
						echo "<div class='art3'>";
						/*Aqui defino cuál va a ser el comportamiento al dar clic sobre el resultado obtenido desde el "a href"*/;
							if($desde_formulario===1){
								echo "<a href=\"javascript:cargar_dependencia_padre('$nombre_dependencia_padre')\" title='Cargar Dependencia Padre'>";
							}else{
								echo "<a href=\"#\"> <script> alert('No, no hay Ahora formulario_nueva_dependencia es '+'$desde_formulario');</script>";
							}
			
						/*Aqui defino cuál va a ser el comportamiento al dar click sobre el 
						resultado obtenido*/			
							echo " (".$codigo_dependencia_padre.") ".
								 $nombre_dependencia_padre." | ";
							echo "<span>Dependencia Padre ( ".$dependencia_padre_padre." ) | Activa -".$activa_padre." "."</span>";
							echo "<span class='ver_creador'> | Creado por ".$creador_dependencia_padre." (".
								 $fecha_modificacion_depe_padre.")</span>";
							echo "</a>";
					/*Hasta aqui debe ir la etiqueta "a href" para que cuando haga clic en cada uno de los resultados*/
						echo "</div>";//cierra div class='art'
					}
				}while ($fila_depe=pg_fetch_assoc($fila_depe_padre));
			}elseif($registros_codi_padre==0 && $search_depe_padre!=''){// Si no encuentra la dependencia padre
				echo "<script>
					$('#error_nombre_dependencia_padre').slideDown('slow');
					$('#error_nombre_dependencia_padre2').slideUp('slow');
				</script>";
							
			}elseif($search_depe_padre==''){
				echo "<script>
					$('#error_nombre_dependencia_padre').slideUp('slow');
				</script>";
				
			}
		}
/* Fin isset ajax (buscador_dependencia_padre) consulta sugerencias - nombre de dependencia padre - Formulario Agregar Dependencia */

/******************************************************************************************/
/* Modificar Dependencia ******************************************************************/
/******************************************************************************************/

/* Isset ajax (buscador_nombre_mod_dependencias) sugerencias - nombre dependencia - Formulario Modificar Dependencia */

		$search_nom_mod_depe ='';
		if(isset($_POST['search_nombre_mod_depe'])){
			$search_nom_mod_depe = $_POST['search_nombre_mod_depe'];
			$search_antiguo_nombre_mod_depe =$_POST['search_antiguo_nombre_mod_depe'];

		$consulta_nombre_mod_depe = 
		"SELECT * FROM dependencias WHERE UPPER(codigo_dependencia) 
		LIKE UPPER('%".$search_nom_mod_depe."') OR UPPER(nombre_dependencia)
		LIKE UPPER('%".$search_nom_mod_depe."%') and activa ='SI' order by nombre_dependencia limit 5";
		$fila_codi_depe = pg_query($conectado,$consulta_nombre_mod_depe);
	/*Calcula el numero de registros que genera la consulta anterior.*/
		$registros_codi_depe= pg_num_rows($fila_codi_depe);

	/* Si el nombre a modificar es el mismo que tenía, quita los errores */
			if($search_nom_mod_depe==$search_antiguo_nombre_mod_depe){
				echo"<script>
					$('.art1').slideUp('slow');
					$('#mod_dependencia_ya_existe').slideUp('slow');
				</script>";
			}
	/* Si el nombre a modificar es el mismo que tenía, quita los errores */

	/*Recorre el array generado e imprime uno a uno los resultados.*/	
			if($registros_codi_depe>0 && $search_nom_mod_depe!=''){
				echo "<script>	
					$('#error_mod_nombre_dependencia').slideUp('slow');
					$('#mod_dependencia_ya_existe').slideUp('slow');
				</script>";

				do{
					for ($i=0;$i<$registros_codi_depe;$i++){
						$linea_depe = pg_fetch_array($fila_codi_depe);

						$id_dependencia = $linea_depe['id_dependencia'];
						$codigo_dependencia = $linea_depe['codigo_dependencia'];
						$nombre_dependencia = $linea_depe['nombre_dependencia'];
						$dependencia_padre = $linea_depe['dependencia_padre'];
						$activa = $linea_depe['activa'];
						$creador_dependencia=$linea_depe['creador_dependencia'];
						$fecha_modificacion_dependencia=$linea_depe['fecha_modificacion'];
		/* Aqui modifico la fecha para que quede con el para mostrar en formato "Jueves 05 de Mayo de 2016"*/
						$fecha_modificacion_depe=$b->traducefecha($fecha_modificacion_dependencia);	
												
						echo "<div class='art1'>";
						/*Aqui defino cuál va a ser el comportamiento al dar clic sobre el resultado obtenido desde el "a href"*/;
							if($desde_formulario===1){
								echo "<a href=\"javascript:error_modificar_dependencia()\">";
							}else{
								echo "<a href=\"#\"> <script> alert('No, no hay Ahora formulario_nueva_dependencia es '+'$desde_formulario');</script>";
							}
			
						/*Aqui defino cuál va a ser el comportamiento al dar click sobre el 
						resultado obtenido*/	
								
							echo " (".$codigo_dependencia.") ".
								 $nombre_dependencia." | ";
							echo "<span>Dependencia Padre ( ".$dependencia_padre." ) | Activa -".$activa." "."</span>";
							echo "<span class='ver_creador'> | Creado por ".$creador_dependencia." (".
								 $fecha_modificacion_depe.")</span>";
							echo "</a>";
					/*Hasta aqui debe ir la etiqueta "a href" para que cuando haga clic en cada uno de los resultados*/
						echo "</div>";//cierra div class='art1'
					}
				}while ($fila_depe=pg_fetch_assoc($fila_codi_depe));
			}	
		}
/* Fin isset ajax (buscador_nombre_mod_dependencias) sugerencias - nombre dependencia - Formulario Modificar Dependencia */

/* Isset ajax (buscador_mod_dependencia_padre) sugerencias - nombre dependencia padre - Formulario Modificar Dependencia */	

		$search_mod_depe_padre ='';
		if(isset($_POST['search_mod_depe_padre'])){
			$search_mod_depe_padre = $_POST['search_mod_depe_padre'];
			$search_antiguo_mod_padre=$_POST['search_antiguo_mod_padre'];

		$consulta_depe_padre = 
		"SELECT * FROM dependencias WHERE UPPER(codigo_dependencia) 
		LIKE UPPER('%".$search_mod_depe_padre."') OR UPPER(nombre_dependencia)
		LIKE UPPER('%".$search_mod_depe_padre."%') and activa ='SI' order by nombre_dependencia limit 5";

		$fila_depe_padre = pg_query($conectado,$consulta_depe_padre);
	/*Calcula el numero de registros que genera la consulta anterior.*/
		$registros_mod_codi_padre= pg_num_rows($fila_depe_padre);

	/*Recorre el array generado e imprime uno a uno los resultados.*/	

			if($registros_mod_codi_padre>0 && $search_mod_depe_padre!=''){
				do{
					for ($i=0;$i<$registros_mod_codi_padre;$i++){
						$linea_depe_padre = pg_fetch_array($fila_depe_padre);

						$id_dependencia_padre = $linea_depe_padre['id_dependencia'];
						$codigo_dependencia_padre = $linea_depe_padre['codigo_dependencia'];
						$nombre_dependencia_padre = $linea_depe_padre['nombre_dependencia'];
						$dependencia_padre_padre = $linea_depe_padre['dependencia_padre'];
						$activa_padre = $linea_depe_padre['activa'];
						$creador_dependencia_padre=$linea_depe_padre['creador_dependencia'];
						$fecha_modificacion_dependencia_padre=$linea_depe_padre['fecha_modificacion'];
		/* Aqui modifico la fecha para que quede con el para mostrar en formato "Jueves 05 de Mayo de 2016"*/
						$fecha_modificacion_depe_padre=$b->traducefecha($fecha_modificacion_dependencia_padre);	
												
						echo "<div class='art2'>";
						/*Aqui defino cuál va a ser el comportamiento al dar clic sobre el resultado obtenido desde el "a href"*/;
							if($desde_formulario===1){
								echo "<a href=\"javascript:cargar_dependencia_mod_padre('$nombre_dependencia_padre')\">";
							}else{
								echo "<a href=\"#\"> <script> alert('No, no hay Ahora formulario_nueva_dependencia es '+'$desde_formulario');</script>";
							}
			
						/*Aqui defino cuál va a ser el comportamiento al dar click sobre el 
						resultado obtenido*/			
							echo " (".$codigo_dependencia_padre.") ".
								 $nombre_dependencia_padre." | ";
							echo "<span>Dependencia Padre ( ".$dependencia_padre_padre." ) | Activa -".$activa_padre." "."</span>";
							echo "<span class='ver_creador'> | Creado por ".$creador_dependencia_padre." (".
								 $fecha_modificacion_depe_padre.")</span>";
							echo "</a>";
					/*Hasta aqui debe ir la etiqueta "a href" para que cuando haga clic en cada uno de los resultados*/
						echo "</div>";//cierra div class='art'
					}
				}while ($fila_depe=pg_fetch_assoc($fila_depe_padre));
			}
		}
/* Fin isset ajax (buscador_mod_dependencia_padre) sugerencias - nombre dependencia padre - Formulario Modificar Dependencia */	

	 ?>
	</body>
</html>
