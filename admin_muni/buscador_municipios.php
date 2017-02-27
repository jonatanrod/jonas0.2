<!DOCTYPE html>
<head>
	<meta charset="UTF-8">
	<title>Buscador de Municipios</title>
</head>
<body>
	<?php 
/*Aqui defino la fecha de la transaccion*/
		require_once('../include/genera_fecha.php');
		require_once('../login/conexion2.php');
		
/*Isset ajax consulta sugerencias - Principal Municipios */	
		$search ='';
		if(isset($_POST['search'])){
			$search = $_POST['search'];
		
		$consulta = "SELECT * FROM municipios WHERE UPPER(nombre_municipio) LIKE UPPER('%".$search."%')	order by nombre_municipio limit 10";
		$fila = pg_query($conectado,$consulta);
		if($fila==false){ // Valida si la tabla municipios existe en la base de datos
			echo '<script>
				alert("No pude conectarme a la tabla M de la base de datos 1, revisa la base de datos por favor");
				window.location.href="principal3.php"
			</script>';	
		}
	/*Calcula el numero de registros que genera la consulta anterior.*/
		$registros= pg_num_rows($fila);

	/*Recorre el array generado e imprime uno a uno los resultados.*/	
			if($registros>0 && $search!=''){
				do{
					$num_fila=0; // Variable declarada para poner color a la fila según ésta variable.
					for ($i=0;$i<$registros;$i++){
						$linea = pg_fetch_array($fila);

						$nombre_municipio = $linea['nombre_municipio'];
						$nombre_departamento = $linea['nombre_departamento'];
						$nombre_pais = $linea['nombre_pais'];
						$nombre_continente = $linea['nombre_continente'];
						$creador_municipio = $linea['creador_municipio'];
						$fecha_creacion = $linea['fecha_creacion'];
						$fecha_creacion = $b->traducefecha($fecha_creacion);//Trae la fecha en formato "Domingo 15 de Mayo de 2016"
							
						echo "<div class='art1";
							if ($num_fila%2==0) echo " fila2"; //si el resto de la división es 0 pongo un color
							else echo " fila1"; //si el resto de la división NO es 0 pongo otro color 
						echo "'>"; 
	/*Aqui defino cuál va a ser el comportamiento al dar clic sobre el resultado obtenido desde el "a href"*/;
							echo "<a href=\"javascript:cargar_modifica_municipio('$nombre_municipio','$nombre_departamento','$nombre_pais','$nombre_continente')\">";	
			
	/*Aqui defino cuál va a ser el comportamiento al dar click sobre el resultado obtenido*/			
							echo $nombre_municipio." (".
								 $nombre_departamento.") ";
							echo "<span>".$nombre_pais." - ".$nombre_continente." "."</span>";
							echo "<span class='ver_creador'> / Creado por ".$creador_municipio." (".
								 $fecha_creacion.")</span>";
							echo "</a>";
	/*Hasta aqui debe ir la etiqueta "a href" para que cuando haga clic en cada uno de los resultados*/
						echo "</div>";//cierra div class='art'
						$num_fila++; 
					}
				}while ($fila=pg_fetch_assoc($fila));
			}else{
					echo "<h2> No se han encontrado resultados</h2><p>Si desea ingresar un nuevo municipio haga click <a href='javascript:abrirVentanaCrearMunicipios();'>aqui</a></p>";
			}
		}
/* Fin que ajax - sugerencias Principal Municipios */	

/*Isset ajax consulta sugerencias pais - Formulario Agregar Nuevo Municipio */	
		$search_pais ='';
		if(isset($_POST['search_pais'])){
			$search_pais = $_POST['search_pais'];
			$search_continente=$_POST['search_continente'];
		
			$consulta_pais = "SELECT distinct nombre_pais, nombre_continente FROM municipios WHERE UPPER(nombre_continente) LIKE UPPER('%".$search_continente."%') and UPPER(nombre_pais) like UPPER('%".$search_pais."%')	order by nombre_pais limit 5";
			$fila_pais = pg_query($conectado,$consulta_pais);
	/*Calcula el numero de registros que genera la consulta anterior.*/
			$registros_pais= pg_num_rows($fila_pais);
	/*Recorre el array generado e imprime uno a uno los resultados.*/	

			if($registros_pais>0 && $search_pais!=''){	
				do{
					for ($i=0;$i<$registros_pais;$i++){
						$linea_pais = pg_fetch_array($fila_pais);

						$nombre_pais = $linea_pais['nombre_pais'];
						$nombre_continente = $linea_pais['nombre_continente'];
						
						echo "<div id='resultado_pais' class='art'>";
	/*Aqui defino cuál va a ser el comportamiento al dar clic sobre el resultado obtenido desde el "a href"*/;
								echo "<a href=\"javascript:cargar_pais('$nombre_pais')\">";							

	/*Aqui defino cuál va a ser el comportamiento al dar click sobre el resultado obtenido*/	
							echo "<span>".$nombre_pais." - ".$nombre_continente."";
							echo "</a>";
	/*Hasta aqui debe ir la etiqueta "a href" para que cuando haga clic en cada uno de los resultados*/
						echo "</div>";//cierra div #resultado_pais
					}
				}while ($fila=pg_fetch_assoc($fila));
			}else{
				echo "";
			}
		}
/* Fin ajax - consulta sugerencias pais - Formulario Agregar Nuevo Municipio */

/*Isset ajax - consulta sugerencias departamento - Formulario Agregar Nuevo Departamento */	
		$search_departamento ='';
		if(isset($_POST['search_departamento'])){
			$search_pais=$_POST['search_pais2'];
			$search_departamento = $_POST['search_departamento'];
		
			$consulta_departamento = "SELECT distinct nombre_departamento, nombre_pais FROM municipios WHERE 
			UPPER(nombre_pais) LIKE UPPER('%".$search_pais."%') and 
			UPPER(nombre_departamento) like UPPER('%".$search_departamento."%')	order by nombre_departamento limit 5";
			$fila_departamento = pg_query($conectado,$consulta_departamento);
	/*Calcula el numero de registros que genera la consulta anterior.*/
			$registros_departamento= pg_num_rows($fila_departamento);
	/*Recorre el array generado e imprime uno a uno los resultados.*/	

			if($registros_departamento>0 && $search_departamento!=''){
				echo'<script>
					oculta_errores();
				</script>';	
				do{
					for ($i=0;$i<$registros_departamento;$i++){
						$linea_departamento = pg_fetch_array($fila_departamento);

						$nombre_departamento = $linea_departamento['nombre_departamento'];
						$nombre_pais = $linea_departamento['nombre_pais'];
						
						echo "<div id='resultado_departamento' class='art'>";
	/*Aqui defino cuál va a ser el comportamiento al dar clic sobre el resultado obtenido desde el "a href"*/;
						echo "<a href=\"javascript:cargar_departamento('$nombre_departamento')\">";

	/*Aqui defino cuál va a ser el comportamiento al dar click sobre el resultado obtenido*/	
							echo "<span>".$nombre_departamento." - ".$nombre_pais."";
							echo "</a>";
	/*Hasta aqui debe ir la etiqueta "a href" para que cuando haga clic en cada uno de los resultados*/
						echo "</div>";//cierra div #resultado_pais
					}
				}while ($fila=pg_fetch_assoc($fila));
			}else{
				echo "";
			}
		}
/* Fin ajax - consulta sugerencias Departamento - Formulario Agregar Nuevo Municipio */

/*Isset ajax - consulta sugerencias Municipio - Formulario Agregar Nuevo Departamento */	
		$search_municipio ='';
		if(isset($_POST['search_municipio'])){
			$search_municipio = $_POST['search_municipio'];
			$search_departamento=$_POST['search_departamento2'];
		
			$consulta_municipio = "SELECT distinct nombre_departamento, nombre_municipio, nombre_pais FROM municipios WHERE 
			UPPER(nombre_municipio) LIKE UPPER('%".$search_municipio."%') and 
			UPPER(nombre_departamento) like UPPER('%".$search_departamento."%')	order by nombre_municipio limit 5";
			$fila_municipio = pg_query($conectado,$consulta_municipio);
	/*Calcula el numero de registros que genera la consulta anterior.*/
			$registros_municipio= pg_num_rows($fila_municipio);
	/*Recorre el array generado e imprime uno a uno los resultados.*/	
			echo'<script>
				oculta_errores();
			</script>';	
			
			if($registros_municipio>0 && $search_municipio!=''){
				do{
					for ($i=0;$i<$registros_municipio;$i++){
						$linea_municipio = pg_fetch_array($fila_municipio);

						$nombre_pais = $linea_municipio['nombre_pais'];
						$nombre_departamento = $linea_municipio['nombre_departamento'];
						$nombre_municipio = $linea_municipio['nombre_municipio'];
						
						echo "<div id='resultado_municipio' class='art'>";
	/*Aqui defino cuál va a ser el comportamiento al dar clic sobre el resultado obtenido desde el "a href"*/;
						echo "<a href=\"javascript:error_municipio_ya_existe()\">";
				
	/*Aqui defino cuál va a ser el comportamiento al dar click sobre el resultado obtenido*/	
							echo "<span>".$nombre_municipio." - ".$nombre_departamento." - ".$nombre_pais."";
							echo "</a>";
	/*Hasta aqui debe ir la etiqueta "a href" para que cuando haga clic en cada uno de los resultados*/
						echo "</div>";//cierra div #resultado_pais
					}
				}while ($fila=pg_fetch_assoc($fila));
			}else{
				echo"";				
			}
		}
/* Fin ajax - consulta sugerencias Municipio - Formulario Agregar Nuevo Municipio */	

/******************************************************************************************/
/* Modificar Municipio ********************************************************************/
/******************************************************************************************/

/*Isset ajax consulta sugerencias pais - Formulario Modificar Municipio */	
		$search_mod_pais ='';
		if(isset($_POST['search_mod_pais'])){
			$search_mod_pais = $_POST['search_mod_pais'];
			$search_ant_pais=$_POST['search_ant_pais'];
			$search_mod_continente=$_POST['search_mod_continente'];
		
			$consulta_mod_pais = "SELECT distinct nombre_pais, nombre_continente FROM municipios WHERE 
			UPPER(nombre_continente) LIKE UPPER('%".$search_mod_continente."%') and 
			UPPER(nombre_pais) like UPPER('%".$search_mod_pais."%')	order by nombre_pais limit 5";
			$fila_mod_pais = pg_query($conectado,$consulta_mod_pais);
	/*Calcula el numero de registros que genera la consulta anterior.*/
			$registros_mod_pais= pg_num_rows($fila_mod_pais);

	/* Si el nombre a modificar es el mismo que tenía, quita los errores */
			if($search_mod_pais==$search_ant_pais){
				echo"<script>
					$('.art').slideUp('slow');
					$('#error_mod_pais_invalido').slideUp('slow');
				</script>";
			}

	/*Recorre el array generado e imprime uno a uno los resultados.*/	

			if($registros_mod_pais>0 && $search_mod_pais!=''){
				echo'<script>
					oculta_mod_errores();
				</script>';	
				do{
					for ($i=0;$i<$registros_mod_pais;$i++){
						$linea_mod_pais = pg_fetch_array($fila_mod_pais);

						$nombre_mod_pais = $linea_mod_pais['nombre_pais'];
						$nombre_mod_continente = $linea_mod_pais['nombre_continente'];
						
						echo "<div id='resultado_mod_pais' class='art'>";
	/*Aqui defino cuál va a ser el comportamiento al dar clic sobre el resultado obtenido desde el "a href"*/;
						echo "<a href=\"javascript:cargar_mod_pais('$nombre_mod_pais')\">";
							
	/*Aqui defino cuál va a ser el comportamiento al dar click sobre el resultado obtenido*/	
							echo "<span>".$nombre_mod_pais." - ".$nombre_mod_continente."";
							echo "</a>";
	/*Hasta aqui debe ir la etiqueta "a href" para que cuando haga clic en cada uno de los resultados*/
						echo "</div>";//cierra div #resultado_pais
					}
				}while ($fila=pg_fetch_assoc($fila));
			}else{
				echo "<h2> No se han encontrado resultados</h2><p>Si desea ingresar un nuevo municipio haga click 
				<a href='javascript:abrirVentanaCrearMunicipios();'>aqui</a></p>";	
			}
		}
/* Fin ajax consulta sugerencias pais - Formulario Modificar Municipio */	

/*Isset ajax consulta sugerencias Departamento - Formulario Modificar Municipio */	
		$search_mod_departamento ='';
		if(isset($_POST['search_mod_departamento'])){
			$search_mod_departamento = $_POST['search_mod_departamento'];
			$search_ant_departamento=$_POST['search_ant_departamento'];
			$search_mod_pais2=$_POST['search_mod_pais2'];
		
			$consulta_mod_departamento = "SELECT distinct nombre_departamento, nombre_pais FROM municipios WHERE 
			UPPER(nombre_pais) LIKE UPPER('%".$search_mod_pais2."%') and 
			UPPER(nombre_departamento) like UPPER('%".$search_mod_departamento."%')	order by nombre_departamento limit 5";
			$fila_mod_departamento = pg_query($conectado,$consulta_mod_departamento);
		//	echo "$consulta_mod_departamento";
		
	/*Calcula el numero de registros que genera la consulta anterior.*/
			$registros_mod_departamento= pg_num_rows($fila_mod_departamento);

	/* Si el nombre a modificar es el mismo que tenía, quita los errores */
			if($search_mod_departamento==$search_ant_departamento){
				echo"<script>
					$('.art').slideUp('slow');
					$('#error_mod_departamento_invalido').slideUp('slow');
				</script>";
			}
	/* Fin script si el nombre a modificar es el mismo que tenía, quita los errores */

	/*Recorre el array generado e imprime uno a uno los resultados.*/	

			if($registros_mod_departamento>0 && $search_mod_departamento!=''){
				echo'<script>
					oculta_mod_errores();
				</script>';	
				do{
					for ($i=0;$i<$registros_mod_departamento;$i++){
						$linea_mod_departamento = pg_fetch_array($fila_mod_departamento);

						$nombre_mod_departamento = $linea_mod_departamento['nombre_departamento'];
						$nombre_mod_pais = $linea_mod_departamento['nombre_pais'];
						
						echo "<div id='resultado_mod_departamento' class='art'>";
	/*Aqui defino cuál va a ser el comportamiento al dar clic sobre el resultado obtenido desde el "a href"*/;
						echo "<a href=\"javascript:cargar_mod_departamento('$nombre_mod_departamento')\">";
							
	/*Aqui defino cuál va a ser el comportamiento al dar click sobre el resultado obtenido*/	
							echo "<span>".$nombre_mod_departamento." - ".$nombre_mod_pais."";
							echo "</a>";
	/*Hasta aqui debe ir la etiqueta "a href" para que cuando haga clic en cada uno de los resultados*/
						echo "</div>";//cierra div #resultado_pais
					}
				}while ($fila=pg_fetch_assoc($fila));
			}else{
				echo "<h2> No se han encontrado resultados</h2><p>Si desea ingresar un nuevo municipio haga click 
				<a href='javascript:abrirVentanaCrearMunicipios();'>aqui</a></p>";
			}
		}
/* Fin ajax consulta sugerencias Departamento - Formulario Modificar Municipio */	

/*Isset ajax consulta sugerencias municipio - Formulario Modificar Municipio */	
		$search_mod_municipio ='';
		if(isset($_POST['search_mod_municipio'])){
			$search_mod_municipio = $_POST['search_mod_municipio'];
			$search_ant_municipio=$_POST['search_ant_municipio'];
			$search_mod_departamento2=$_POST['search_mod_departamento2'];
		
			$consulta_mod_municipio = "SELECT distinct nombre_municipio, nombre_departamento FROM municipios WHERE 
			UPPER(nombre_departamento) LIKE UPPER('%".$search_mod_departamento2."%') and 
			UPPER(nombre_municipio) like UPPER('%".$search_mod_municipio."%')	order by nombre_municipio limit 5";
			$fila_mod_municipio = pg_query($conectado,$consulta_mod_municipio);
		//	echo "$consulta_mod_municipio";
		
	/*Calcula el numero de registros que genera la consulta anterior.*/
			$registros_mod_municipio= pg_num_rows($fila_mod_municipio);

	/* Si el nombre a modificar es el mismo que tenía, quita los errores */
			if($search_mod_municipio==$search_ant_municipio){
				echo"<script>
					$('.art').slideUp('slow');
					$('#error_mod_municipio_invalido').slideUp('slow');
				</script>";
			}
	/* Fin script si el nombre a modificar es el mismo que tenía, quita los errores */

	/*Recorre el array generado e imprime uno a uno los resultados.*/	

			if($registros_mod_municipio>0 && $search_mod_municipio!=''){
				echo'<script>
					oculta_mod_errores();
				</script>';	
				do{
					for ($i=0;$i<$registros_mod_municipio;$i++){
						$linea_mod_municipio = pg_fetch_array($fila_mod_municipio);

						$nombre_mod_municipio = $linea_mod_municipio['nombre_municipio'];
						$nombre_mod_departamento = $linea_mod_municipio['nombre_departamento'];
						
						echo "<div id='resultado_mod_municipio' class='art'>";
	/*Aqui defino cuál va a ser el comportamiento al dar clic sobre el resultado obtenido desde el "a href"*/;
						echo "<a href=\"javascript:cargar_mod_municipio('$nombre_mod_municipio')\">";

	/*Aqui defino cuál va a ser el comportamiento al dar click sobre el resultado obtenido*/	
							echo "<span>".$nombre_mod_municipio." - ".$nombre_mod_departamento."";
							echo "</a>";
	/*Hasta aqui debe ir la etiqueta "a href" para que cuando haga clic en cada uno de los resultados*/
						echo "</div>";//cierra div #resultado_departamento
					}
				}while ($fila=pg_fetch_assoc($fila));
			}else{
				echo "<h2> No se han encontrado resultados</h2><p>Si desea ingresar un nuevo municipio haga click 
				<a href='javascript:abrirVentanaCrearMunicipios();'>aqui</a></p>";
			}
		}
/* Fin ajax consulta sugerencias municipio - Formulario Modificar Municipio */	
	 ?>
 </body>
</html>
