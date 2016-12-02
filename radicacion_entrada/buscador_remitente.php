<!DOCTYPE html>
<head>
		<meta charset="UTF-8">
		<title>Buscador de remitente</title>
</head>
<body>
	<?php 
		require_once('../login/conexion.php');//cambiar por ../login/conexion.php
		$busca_contactos ='';
		$permiso_agregar_usuarios ='';//Viene de funciones_contactos.js
		$usuario = 'Jonas';//Por definir como lo voy a recuperar.

/*La variable $desde_formulario me define desde ajax a ver cual formulario estoy invocando para condicionar lo que voy a mostrar.*/ 

		if(isset($_POST['search_remitente'])){
			$busca_contactos = $_POST['search_remitente'];
			$permiso_agregar_usuarios = $_POST['permiso_agregar_usuarios'];

			$consulta = "SELECT * FROM contactos WHERE UPPER(nombre_contacto) LIKE UPPER('%".$busca_contactos."%') 
			or nit_contacto LIKE UPPER('%".$busca_contactos."%') order by nombre_contacto limit 10";
			
			$fila = pg_query($conectado,$consulta);
	/*Calcula el numero de registros que genera la consulta anterior.*/
			$registros= pg_num_rows($fila);
	/*Recorre el array generado e imprime uno a uno los resultados.*/	
			if($registros>0 && $busca_contactos!=''){//$busca_contactos= $search_remitente
				do{
					for ($i=0;$i<$registros;$i++){
						$linea = pg_fetch_array($fila);

						$nombre_contacto = $linea['nombre_contacto'];
						$nit_contacto = $linea['nit_contacto'];
						$ubicacion_contacto = $linea['ubicacion_contacto'];
						$direccion_contacto = $linea['direccion_contacto'];
						$telefono_contacto = $linea['telefono_contacto'];
						$mail_contacto = $linea['mail_contacto'];
						$representante_legal = $linea['representante_legal'];
						$creador_contacto = $linea['creador_contacto'];
						$codigo_contacto = $linea['codigo_contacto'];
						$fecha_creacion_usuario = $linea['fecha_creacion'];

					echo "<div class='sugerencia_contacto' title='Cargar este contacto y seguir a Radicación de Entrada'>"
			/*Aqui defino cuál va a ser el comportamiento al dar clic sobre el resultado obtenido desde el "a href"*/;

						echo "<a href=\"javascript:cargar_formulario_radicacion_entrada('$nombre_contacto','$nit_contacto','$ubicacion_contacto','$direccion_contacto','$telefono_contacto','$mail_contacto','$representante_legal', '$codigo_contacto')\">";
							echo'	<span class="titulo">
										<strong>'
											.$nombre_contacto.'
										</strong>'." ("
										.$nit_contacto.") ".
									"</span>";
					/*Etiqueta span para que el nombre del pais y continente tenga otro formato*/
								echo'<br/><span class="subtitulo">'
										.$ubicacion_contacto." / ".
										 $direccion_contacto." /<br>
										 Telefono : ".
										 $telefono_contacto." / ".
										 $mail_contacto."<br/>".
									"</span>";
					/*Fin etiqueta span para que el nombre del pais y continente tenga otro formato*/
						echo "</a>";
			/*Hasta aqui debe ir la etiqueta "a href" para que cuando haga clic en cada uno de los resultados*/
					echo "</div>";//cierra div class='resultado_municipio'(art)
					//	$municipio_recibido = $linea['nombre_municipio'];
					}
				}while ($fila=pg_fetch_assoc($fila));
			}else{
				if($permiso_agregar_usuarios=='NO'){//Eso es que viene desde formulario y no tiene permisos para ingresar nuevo contacto
					echo "<div> El contacto ingresado no existe en la base de datos. 
						<br>
						Si desea ingresar un nuevo contacto comuníquese con el Administrador del sistema </div>";

				}elseif($permiso_agregar_usuarios=='SI'){//Esto es que tiene permisos para ingresar nuevo contacto
					echo "<div> No se han encontrado resultados. Si desea ingresar un nuevo contacto haga click 
					<a href='javascript:abrir_ventana_agregar_contacto();'>Aqui</a> </div>";
				}else{
					//echo "string";
				}
			}
		}elseif(isset($_POST['nombre_contacto'])){
			$busca_contactos = $_POST['nombre_contacto'];
			$consulta = "SELECT * FROM contactos WHERE UPPER(nombre_contacto) LIKE UPPER('%".$busca_contactos."%') 
			or nit_contacto LIKE UPPER('%".$busca_contactos."%') order by nombre_contacto limit 5";
			
			$fila = pg_query($conectado,$consulta);
	/*Calcula el numero de registros que genera la consulta anterior.*/
			$registros= pg_num_rows($fila);
	/*Recorre el array generado e imprime uno a uno los resultados.*/	
			if($registros>0 && $busca_contactos!=''){//$busca_contactos= $nombre_contacto
				echo"
					<script>
						$('#error_nombre_contacto').slideUp('slow');
					</script>";
				do{
					for ($i=0;$i<$registros;$i++){
						$linea = pg_fetch_array($fila);

						$nombre_contacto = $linea['nombre_contacto'];
						$nit_contacto = $linea['nit_contacto'];
						$ubicacion_contacto = $linea['ubicacion_contacto'];
						$direccion_contacto = $linea['direccion_contacto'];
						$telefono_contacto = $linea['telefono_contacto'];
						$mail_contacto = $linea['mail_contacto'];
						$representante_legal = $linea['representante_legal'];
						$creador_contacto = $linea['creador_contacto'];
						$codigo_contacto = $linea['codigo_contacto'];
						$fecha_creacion_usuario = $linea['fecha_creacion'];

					echo "<div class='sugerencia_contacto_radicacion_entrada' title='Cargar este contacto y seguir a Radicación de Entrada'>"
			/*Aqui defino cuál va a ser el comportamiento al dar clic sobre el resultado obtenido desde el "a href"*/;

						echo "<a href=\"javascript:cargar_formulario_radicacion_entrada('$nombre_contacto','$nit_contacto','$ubicacion_contacto','$direccion_contacto','$telefono_contacto','$mail_contacto','$representante_legal', '$codigo_contacto')\">";
							echo'	<span class="titulo">
										<strong>'
											.$nombre_contacto.'
										</strong>'." ("
										.$nit_contacto.") ".
									"</span>";
					/*Etiqueta span para que el nombre del pais y continente tenga otro formato*/
								echo'<br/><span class="subtitulo">'
										.$ubicacion_contacto." / ".
										 $direccion_contacto." /<br>
										 Telefono : ".
										 $telefono_contacto." / ".
										 $mail_contacto."<br/>".
									"</span>";
					/*Fin etiqueta span para que el nombre del pais y continente tenga otro formato*/
						echo "</a>";
					/*Hasta aqui debe ir la etiqueta "a href" para que cuando haga clic en cada uno de los resultados*/
					echo "</div>";//cierra div class='resultado_municipio'(art)
					//	$municipio_recibido = $linea['nombre_municipio'];
					}
				}while ($fila=pg_fetch_assoc($fila));
			}else{
				echo"
				<script>
					$('#error_nombre_contacto').fadeOut();
					$('#contacto_ya_existe').fadeOut();
				</script>";
			}
		}elseif(isset($_POST['search_nit'])){
			$busca_nit = $_POST['search_nit'];
		
			$consulta_nit = "SELECT * FROM contactos WHERE UPPER(nombre_contacto)
				LIKE UPPER('%".$busca_nit."%') or nit_contacto LIKE 
				UPPER('%".$busca_nit."%') order by nombre_contacto limit 5";
				$fila_nit = pg_query($conectado,$consulta_nit);
			/*Calcula el numero de registros que genera la consulta anterior.*/
					$registros= pg_num_rows($fila_nit);
			/*Recorre el array generado e imprime uno a uno los resultados.*/	

				if($registros>0 && $busca_nit!=''){//$busca_contactos= $search
					do{
						echo"
						<script>
							$('#error_nit_contacto').fadeOut();
						</script>";
						for ($i=0;$i<$registros;$i++){
							$linea = pg_fetch_array($fila_nit);

							$nombre_contacto = $linea['nombre_contacto'];
							$nit_contacto = $linea['nit_contacto'];
							$ubicacion_contacto = $linea['ubicacion_contacto'];
							$direccion_contacto = $linea['direccion_contacto'];
							$telefono_contacto = $linea['telefono_contacto'];
							$mail_contacto = $linea['mail_contacto'];
							$representante_legal = $linea['representante_legal'];
							$creador_contacto = $linea['creador_contacto'];
							$codigo_contacto = $linea['codigo_contacto'];
							$fecha_creacion_usuario = $linea['fecha_creacion'];

						echo "<div class='sugerencia_nit_contacto_radicacion_entrada' title='Cargar este contacto y seguir a Radicación de Entrada'>";
				/* Aqui defino cuál va a ser el comportamiento al dar clic sobre el resultado obtenido desde el "a href" */

						echo "<a href=\"javascript:cargar_formulario_radicacion_entrada('$nombre_contacto','$nit_contacto','$ubicacion_contacto','$direccion_contacto','$telefono_contacto','$mail_contacto','$representante_legal', '$codigo_contacto')\">";						
						echo' 	<span class="titulo">
									<strong>'
										.$nombre_contacto.'
									</strong>'." (".
									 	$nit_contacto.") ".
								"</span>";
				/*Etiqueta span para que el nombre del pais y continente tenga otro formato*/
								echo'<br/>
								<span class="subtitulo">'.
									$ubicacion_contacto." / ".
									$direccion_contacto." / Telefono : ".
									$telefono_contacto." / ".
									$mail_contacto."<br/>".
								"</span>";
				/*Fin etiqueta span para que el nombre del pais y continente tenga otro formato*/
							echo "</a>";
				/*Hasta aqui debe ir la etiqueta "a href" para que cuando haga clic*/
							echo "</div>";//cierra div class='resultado_municipio'(art)
							//	$municipio_recibido = $linea['nombre_municipio'];
						}
					}while ($fila=pg_fetch_assoc($fila));
			}else{
				echo"
				<script>
					$('#error_nit_contacto').fadeOut();
					$('#nit_ya_existe').fadeOut();
				</script>";
			}
		}elseif(isset($_POST['search_muni'])){
			$busca_muni = $_POST['search_muni'];
		
					$consulta_municipio = "SELECT * FROM municipios WHERE UPPER(nombre_municipio)
					LIKE UPPER('%".$busca_muni."%') order by nombre_municipio limit 10";

					$fila_municipio = pg_query($conectado,$consulta_municipio);
			/*Calcula el numero de registros que genera la consulta anterior.*/
					$registros= pg_num_rows($fila_municipio);
			/*Recorre el array generado e imprime uno a uno los resultados.*/	

			if($registros>0 && $busca_muni!=''){//$busca_muni= $search
				do{
					for ($i=0;$i<$registros;$i++){
						$linea = pg_fetch_array($fila_municipio);

						$nombre_municipio = $linea['nombre_municipio'];
						$nombre_departamento = $linea['nombre_departamento'];
						$nombre_pais = $linea['nombre_pais'];
						$nombre_continente = $linea['nombre_continente'];
						
					echo "<div class='sugerencia_municipio' title='Cargar este municipio'>";

			/* Aqui defino cuál va a ser el comportamiento al dar clic sobre el resultado obtenido desde el "a href" */
						echo "<a href=\"javascript:cargar_valor_municipio('$nombre_municipio','$nombre_departamento','$nombre_pais','$nombre_continente')\">";						
								echo $nombre_municipio." (".
									 $nombre_departamento.") ";
								echo "<span>".$nombre_pais." - ".$nombre_continente." "."</span>";			
						echo "</a>";

			/*Hasta aqui debe ir la etiqueta "a href" para que cuando haga clic*/

					echo "</div>";//cierra div class='sugerencia_contacto'(art)
					}
				}while ($fila=pg_fetch_assoc($fila));
			}
		}elseif(isset($_POST['search_muni_mod'])){
			$busca_muni_mod = $_POST['search_muni_mod'];
		
					$consulta_municipio = "SELECT * FROM municipios WHERE UPPER(nombre_municipio)
					LIKE UPPER('%".$busca_muni_mod."%') order by nombre_municipio limit 10";

					$fila_municipio_mod = pg_query($conectado,$consulta_municipio);
			/*Calcula el numero de registros que genera la consulta anterior.*/
					$registros= pg_num_rows($fila_municipio_mod);
			/*Recorre el array generado e imprime uno a uno los resultados.*/	

			if($registros>0 && $busca_muni_mod!=''){//$busca_muni= $search
				do{
					for ($i=0;$i<$registros;$i++){
						$linea2 = pg_fetch_array($fila_municipio_mod);

						$nombre_municipio_mod = $linea2['nombre_municipio'];
						$nombre_departamento_mod = $linea2['nombre_departamento'];
						$nombre_pais_mod = $linea2['nombre_pais'];
						$nombre_continente_mod = $linea2['nombre_continente'];

					echo "<div class='sugerencia_contacto' title='Cargar este contacto y seguir a Radicación de Entrada'>";

			/* Aqui defino cuál va a ser el comportamiento al dar clic sobre el resultado obtenido desde el "a href" */
						echo "<a href=\"javascript:cargar_valor_municipio_mod('$nombre_municipio_mod','$nombre_departamento_mod','$nombre_pais_mod','$nombre_continente_mod')\">";						
								echo $nombre_municipio_mod." (".
									 $nombre_departamento_mod.") ";
								echo "<span>".$nombre_pais_mod." - ".$nombre_continente_mod." "."</span>";			
						echo "</a>";
					echo "</div>";//cierra div class='sugerencia_contacto'(art)
			/*Hasta aqui debe ir la etiqueta "a href" para que cuando haga clic*/
					}
				}while ($fila=pg_fetch_assoc($fila));
			}elseif($registros>0 && $busca_muni_mod==''){
				echo "<div> Ingresa un parámetro de búsqueda</div>";
			}elseif($busca_muni_mod!='' && $registros<1 && $busca_muni!='BOGOTA(D.C.) COLOMBIA-AMERICA'){
						echo "<div> No se han encontrado resultados con el valor digitado. Si desea ingresar un nuevo municipio haga click 
							<a href='javascript:carga_administrador_municipios();'>aqui</a> </div>";
			}else{
				if($registros<1 ){
					if($busca_muni='BOGOTA(D.C.) COLOMBIA-AMERICA'){
						echo "<div>yyy </div>";
					}else{
						if($formulario_nuevo_contacto=='0'){
						echo "<div> formulario_nuevo_contacto=='0'</div>";

						}elseif($formulario_nuevo_contacto=='1'){
							echo "<div> No se han encontrado resultados. Si desea ingresar un nuevo municipio haga click 
							<a href='javascript:carga_administrador_municipios();'>aqui</a> </div>";
						}else{
							echo "<div> formulario2 </div> ";
						}
					}

					
				}
			}
		}else{
			echo "El sistema no esta recibiendo la variable correcta. Por favor comuniquese con el administrador del sistema.";
		}	
	/*Fin recorre el array generado e imprime uno a uno los resultados.*/	
	
	 ?>
	 
 </body>
</html>
