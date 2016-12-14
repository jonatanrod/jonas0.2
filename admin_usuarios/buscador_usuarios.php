<!DOCTYPE html>
<head>
	<meta charset="UTF-8">
	<title>Buscador de Usuarios</title>
	<script type="text/javascript" src="include/js/jquery.js"></script>
</head>
<body>
<?php 
	/*Aqui defino la fecha de la transaccion*/
	require_once('../include/genera_fecha.php');
	require_once('../login/conexion2.php');
		//sleep(1);
		$permiso_administrador = 1;/*Falta por definir el permiso en usuarios
		Lo pongo temporalmente 1 pero hay que definirlo.*/
		if(isset($_POST['desde_formulario'])){
			$desde_formulario = $_POST['desde_formulario']; 
		}
		else{
			$desde_formulario=1;
		}
/*Isset ajax consulta sugerencias - Principal Usuarios */	
		$search_usuario ='';
		if(isset($_POST['search_usuario'])){
			$search_usuario = $_POST['search_usuario'];

		$consulta_usuario="SELECT * FROM usuarios u inner join dependencias d 
		on u.codigo_dependencia=d.codigo_dependencia 
		WHERE UPPER(nombre_completo) LIKE UPPER('%".$search_usuario."%') 
		OR UPPER(login) LIKE UPPER('%".$search_usuario."%') 
		OR documento_usuario LIKE '%".$search_usuario."%'
		order by u.nombre_completo limit 10";

		$fila_usuario = pg_query($conectado,$consulta_usuario);
	/*Calcula el numero de registros que genera la consulta anterior.*/
		$registros_usuario= pg_num_rows($fila_usuario);
	/*Recorre el array generado e imprime uno a uno los resultados.*/	

			if($registros_usuario>0 && $search_usuario!=''){

				do{
					$num_fila=0;
					for ($i=0;$i<$registros_usuario;$i++){
						$linea = pg_fetch_array($fila_usuario);

						$identificacion = $linea['documento_usuario'];
						$nombre_completo = $linea['nombre_completo'];
						$login = $linea['login'];
						$mail = $linea['mail_usuario'];
						$codigo_dependencia = $linea['codigo_dependencia'];
						$nombre_dependencia=$linea['nombre_dependencia'];
						$perfil = $linea['perfil'];
						$imagen=$linea['path_foto'];
						$estado = $linea['estado'];
						$usuario_nuevo = $linea['usuario_nuevo'];
						$nivel_seguridad = $linea['nivel_seguridad'];
						$id_usuario = $linea['id_usuario'];
						$ventanilla_radicacion = $linea['ventanilla_radicacion'];

						$fecha_modificacion=$linea['fecha_modificacion'];//Fecha que tiene registro en base de datos
						$fecha_creacion = $b->traducefecha($fecha_modificacion);//Trduce la fecha en formato "Domingo 15 de Mayo de 2016"
							
						echo "<div class='art";
							if ($num_fila%2==0) echo " fila2"; //si el resto de la división es 0 pongo un color
							else echo " fila1"; //si el resto de la división NO es 0 pongo otro color 
						echo "'>"; 
	/*Aqui defino cuál va a ser el comportamiento al dar clic sobre el resultado obtenido desde el "a href"*/;
							echo "<a href=\"javascript:cargar_modifica_usuario('$identificacion','$nombre_completo','$login','$mail','$codigo_dependencia','$nombre_dependencia','$perfil','$estado','$usuario_nuevo','$nivel_seguridad','$id_usuario','$ventanilla_radicacion')\">";

	/*Aqui defino lo que se muestra del resultado obtenido*/						
								echo "
									<div style='float:left;'>
											<img src='".$imagen."' height='40' width='40' class='fotos'> 
									</div>
									<div style='padding-left: 50px;'>
										<b>".$nombre_completo."</b> ( ".$login." )  
									</div>
									<div style='padding-left:50px;'>
										<span>".$codigo_dependencia." - ".$nombre_dependencia."</span>
									</div>
								</a>";
	/*Hasta aqui debe ir la etiqueta "a href" para que cuando haga clic en cada uno de los resultados*/
						echo "</div>";//cierra div class='art'
						$num_fila++; 
					}
				}while ($fila_usuario=pg_fetch_assoc($fila_usuario));
			}else{
				if($permiso_administrador==1){ // Se usa variable para que no salga "Para agregar usuario haga click aqui"
					echo "<h2> No se han encontrado resultados</h2><p>Si desea ingresar un nuevo usuario haga click 
					<a href='javascript:abrirVentanaCrearUsuarios();'>aqui</a></p>";
				}else{
					echo"<script>$('#error_usuarios').slideDown('slow');</script>";
				}	
			}
		}
/* Fin que ajax - sugerencias Principal Usuarios */	

/*Isset ajax consulta sugerencias - Identificacion Formulario Agregar Usuarios */	
		$search_identificacion ='';
		if(isset($_POST['search_identificacion'])){
			$search_identificacion = $_POST['search_identificacion'];

		$consulta_identificacion="SELECT * FROM usuarios u inner join dependencias d 
		on u.codigo_dependencia=d.codigo_dependencia 
		WHERE UPPER(documento_usuario) LIKE UPPER('%".$search_identificacion."%') 
		order by u.nombre_completo limit 10";

		$fila_identificacion = pg_query($conectado,$consulta_identificacion);
	/*Calcula el numero de registros que genera la consulta anterior.*/
		$registros_identificacion= pg_num_rows($fila_identificacion);
	/* Quita los errores que se visualizan en formulario*/
		echo'<script>
			$("#error_identificacion").slideUp("slow");
			$("#valida_minimo_identificacion").slideUp("slow");
			$("#valida_maximo_identificacion").slideUp("slow");
			$("#error_identificacion_ya_existe").slideUp("slow");					
		</script>';	

	/*Recorre el array generado e imprime uno a uno los resultados.*/	
			if($registros_identificacion>0 && $search_identificacion!=''){
				do{
					$num_fila=0;
					for ($i=0;$i<$registros_identificacion;$i++){
						$linea = pg_fetch_array($fila_identificacion);

						$perfil = $linea['perfil'];
						$codigo_dependencia = $linea['codigo_dependencia'];
						$login = $linea['login'];
						$estado = $linea['estado'];
						$nombre_completo = $linea['nombre_completo'];
						$usuario_nuevo = $linea['usuario_nuevo'];
						$documento_usuario = $linea['documento_usuario'];
						$sesion = $linea['sesion'];
						$fecha_sesion = $linea['fecha_sesion'];
						$nivel_seguridad = $linea['nivel_seguridad'];
						$mail_usuario = $linea['mail_usuario'];
						$id_usuario = $linea['id_usuario'];
						$imagen = $linea['path_foto'];
						$nombre_dependencia=$linea['nombre_dependencia'];
						$fecha_modificacion=$linea['fecha_modificacion'];//Fecha que tiene registro en base de datos
						$fecha_creacion = $b->traducefecha($fecha_modificacion);//Trduce la fecha en formato "Domingo 15 de Mayo de 2016"
					
							echo "
					<div class='tooltip'>	
						<div id='sugerencia_id' class='art1 ";
							if ($num_fila%2==0) echo " fila2"; //si el resto de la división es 0 pongo un color
							else echo " fila1"; //si el resto de la división NO es 0 pongo otro color 
						echo "'>"; 
	/*Aqui defino cuál va a ser el comportamiento al dar clic sobre el resultado obtenido desde el "a href"*/;
							echo "<a href=\"javascript:valida_identificacion_ya_existe()\">";

	/*Aqui defino lo que se muestra del resultado obtenido*/						
								echo "
									<div style='float:left;'>
										<img src='".$imagen."' height='40' width='40' class='fotos'> 
									</div>
									<div style='padding-left: 50px;'>
										<b>".$nombre_completo."</b> ( ".$login." ) ".$mail_usuario." 
									</div>
									<div style='padding-left:50px;'>
										<span>".$codigo_dependencia." - ".$nombre_dependencia."</span>
									</div>
								</a>";
	/*Hasta aqui debe ir la etiqueta "a href" para que cuando haga clic en cada uno de los resultados*/
				echo "	</div> <!--cierra div class='art1' -->
				  		<span class='tooltiptext'>Usuario se encuentra ".$estado."<br> con el perfil ".$perfil."<br> Nivel de Seguridad ".$nivel_seguridad." 
				  		</span>
 					</div>"; // Cierra div class='tooltip'
						$num_fila++; 
					}
				}while ($fila_identificacion=pg_fetch_assoc($fila_identificacion));
			}else{
				/*Aqui va lo que quiero mostrar si no hay resultados*/
			}
		}
/* Fin que ajax - sugerencias Identificacion Formulario Agregar Usuarios */	

/*Isset ajax consulta sugerencias - nombre_completo Formulario Agregar Usuarios */	
		$search_nombre_completo ='';
		if(isset($_POST['search_nombre_completo'])){
			$search_nombre_completo = $_POST['search_nombre_completo'];

		$consulta_nombre_completo="SELECT * FROM usuarios u inner join dependencias d 
		on u.codigo_dependencia=d.codigo_dependencia 
		WHERE UPPER(nombre_completo) LIKE UPPER('%".$search_nombre_completo."%')
		or UPPER(login) LIKE UPPER('%".$search_nombre_completo."%') 
		order by u.nombre_completo limit 10";

		$fila_nombre_completo = pg_query($conectado,$consulta_nombre_completo);
	/*Calcula el numero de registros que genera la consulta anterior.*/
		$registros_nombre_completo= pg_num_rows($fila_nombre_completo);
	/* Quita los errores que se visualizan en formulario*/
		echo'<script>
			$("#error_nombre_completo").slideUp("slow");
			$("#valida_minimo_nombre_completo").slideUp("slow");
			$("#valida_maximo_nombre_completo").slideUp("slow");
			$("#error_nombre_completo_ya_existe").slideUp("slow");
		</script>';	

	/*Recorre el array generado e imprime uno a uno los resultados.*/	
			if($registros_nombre_completo>0 && $search_nombre_completo!=''){
				do{
					$num_fila=0;
					for ($i=0;$i<$registros_nombre_completo;$i++){
						$linea = pg_fetch_array($fila_nombre_completo);

						$perfil = $linea['perfil'];
						$codigo_dependencia = $linea['codigo_dependencia'];
						$login = $linea['login'];
						$estado = $linea['estado'];
						$nombre_completo = $linea['nombre_completo'];
						$usuario_nuevo = $linea['usuario_nuevo'];
						$documento_usuario = $linea['documento_usuario'];
						$sesion = $linea['sesion'];
						$fecha_sesion = $linea['fecha_sesion'];
						$nivel_seguridad = $linea['nivel_seguridad'];
						$mail_usuario = $linea['mail_usuario'];
						$id_usuario = $linea['id_usuario'];
						$imagen = $linea['path_foto'];
						$nombre_dependencia=$linea['nombre_dependencia'];
						$fecha_modificacion=$linea['fecha_modificacion'];//Fecha que tiene registro en base de datos
						$fecha_creacion = $b->traducefecha($fecha_modificacion);//Trduce la fecha en formato "Domingo 15 de Mayo de 2016"
					
							echo "
					<div class='tooltip'>	
						<div id='sugerencia_nombre_completo' class='art1 ";
							if ($num_fila%2==0) echo " fila2"; //si el resto de la división es 0 pongo un color
							else echo " fila1"; //si el resto de la división NO es 0 pongo otro color 
						echo "'>"; 
	/*Aqui defino cuál va a ser el comportamiento al dar clic sobre el resultado obtenido desde el "a href"*/;
							echo "<a href=\"javascript:valida_nombre_completo_ya_existe()\">";

	/*Aqui defino lo que se muestra del resultado obtenido*/						
								echo "
									<div style='float:left;'>
										<img src='".$imagen."' height='40' width='40' class='fotos'> 
									</div>
									<div style='padding-left: 50px;'>
										<b>".$nombre_completo."</b> ( ".$login." ) ".$mail_usuario." 
									</div>
									<div style='padding-left:50px;'>
										<span>".$codigo_dependencia." - ".$nombre_dependencia."</span>
									</div>
								</a>";
	/*Hasta aqui debe ir la etiqueta "a href" para que cuando haga clic en cada uno de los resultados*/
				echo "	</div> <!--cierra div class='art1' -->
				  		<span class='tooltiptext'>Usuario se encuentra ".$estado."<br> con el perfil ".$perfil."<br> Nivel de Seguridad ".$nivel_seguridad." 
				  		</span>
 					</div>"; // Cierra div class='tooltip'
						$num_fila++; 
					}
				}while ($fila_nombre_completo=pg_fetch_assoc($fila_nombre_completo));
			}else{
				/*Aqui va lo que quiero mostrar si no hay resultados*/
			}
		}
/* Fin que ajax - sugerencias nombre_completo Formulario Agregar Usuarios */	
/*Isset ajax consulta sugerencias - login Formulario Agregar Usuarios */	
		$search_login ='';
		if(isset($_POST['search_login'])){
			echo "$search_login";
			$search_login = $_POST['search_login'];

		$consulta_login="SELECT * FROM usuarios u inner join dependencias d 
		on u.codigo_dependencia=d.codigo_dependencia 
		WHERE UPPER(nombre_completo) LIKE UPPER('%".$search_login."%')
		or UPPER(login) LIKE UPPER('%".$search_login."%') 
		order by u.nombre_completo limit 10";

		$fila_login = pg_query($conectado,$consulta_login);
	/*Calcula el numero de registros que genera la consulta anterior.*/
		$registros_login= pg_num_rows($fila_login);
	/* Quita los errores que se visualizan en formulario*/
		echo'<script>
			$("#error_login").slideUp("slow");
			$("#valida_minimo_login").slideUp("slow");
			$("#valida_maximo_login").slideUp("slow");
			$("#error_login_ya_existe").slideUp("slow");
		</script>';	

	/*Recorre el array generado e imprime uno a uno los resultados.*/	
			if($registros_login>0 && $search_login!=''){
				do{
					$num_fila=0;
					for ($i=0;$i<$registros_login;$i++){
						$linea = pg_fetch_array($fila_login);

						$perfil = $linea['perfil'];
						$codigo_dependencia = $linea['codigo_dependencia'];
						$login = $linea['login'];
						$estado = $linea['estado'];
						$nombre_completo = $linea['nombre_completo'];
						$usuario_nuevo = $linea['usuario_nuevo'];
						$documento_usuario = $linea['documento_usuario'];
						$sesion = $linea['sesion'];
						$fecha_sesion = $linea['fecha_sesion'];
						$nivel_seguridad = $linea['nivel_seguridad'];
						$mail_usuario = $linea['mail_usuario'];
						$id_usuario = $linea['id_usuario'];
						$imagen = $linea['path_foto'];
						$nombre_dependencia=$linea['nombre_dependencia'];
						$fecha_modificacion=$linea['fecha_modificacion'];//Fecha que tiene registro en base de datos
						$fecha_creacion = $b->traducefecha($fecha_modificacion);//Trduce la fecha en formato "Domingo 15 de Mayo de 2016"
					
							echo "
					<div class='tooltip'>	
						<div id='sugerencia_login' class='art1 ";
							if ($num_fila%2==0) echo " fila2"; //si el resto de la división es 0 pongo un color
							else echo " fila1"; //si el resto de la división NO es 0 pongo otro color 
						echo "'>"; 
	/*Aqui defino cuál va a ser el comportamiento al dar clic sobre el resultado obtenido desde el "a href"*/;
							echo "<a href=\"javascript:valida_login_ya_existe()\">";

	/*Aqui defino lo que se muestra del resultado obtenido*/						
								echo "
									<div style='float:left;'>
										<img src='".$imagen."' height='40' width='40' class='fotos'> 
									</div>
									<div style='padding-left: 50px;'>
										<b>".$nombre_completo."</b> ( ".$login." ) ".$mail_usuario." 
									</div>
									<div style='padding-left:50px;'>
										<span>".$codigo_dependencia." - ".$nombre_dependencia."</span>
									</div>
								</a>";
	/*Hasta aqui debe ir la etiqueta "a href" para que cuando haga clic en cada uno de los resultados*/
				echo "	</div> <!--cierra div class='art1' -->
				  		<span class='tooltiptext'>Usuario se encuentra ".$estado."<br> con el perfil ".$perfil."<br> Nivel de Seguridad ".$nivel_seguridad." 
				  		</span>
 					</div>"; // Cierra div class='tooltip'
						$num_fila++; 
					}
				}while ($fila_login=pg_fetch_assoc($fila_login));
			}else{
				/*Aqui va lo que quiero mostrar si no hay resultados*/
			}
		}
/* Fin que ajax - sugerencias login Formulario Agregar Usuarios */	
/*Isset ajax consulta sugerencias - dependencia Formulario Agregar Usuarios */	
		$search_dependencia ='';
		if(isset($_POST['search_dependencia'])){
			echo "$search_dependencia";
			$search_dependencia = $_POST['search_dependencia'];

			$consulta_dependencia="SELECT * FROM dependencias where UPPER(codigo_dependencia) like UPPER('%".$search_dependencia."%')
			or UPPER(nombre_dependencia) like UPPER('%".$search_dependencia."%') and activa='SI' order by nombre_dependencia limit 5";
			$fila_dependencia = pg_query($conectado,$consulta_dependencia);
	/*Calcula el numero de registros que genera la consulta anterior.*/
			$registros_dependencia= pg_num_rows($fila_dependencia);
	/* Quita los errores que se visualizan en formulario*/
			echo'<script>
				$("#error_dependencia").slideUp("slow");
				$("#valida_minimo_dependencia").slideUp("slow");
				$("#valida_maximo_dependencia").slideUp("slow");
				$("#error_dependencia_invalida").slideUp("slow");
			</script>';	

	/* Recorre el array generado e imprime uno a uno los resultados.*/	
			if($registros_dependencia>0 && $search_dependencia!=''){
				echo "<script>
					$('#error_dependencia_inexistente').slideUp();
					$('#sugerencias_dependencia').slideDown();
				</script>";
				do{
					$num_fila=0;
					for ($i=0;$i<$registros_dependencia;$i++){
						$linea = pg_fetch_array($fila_dependencia);

						$codigo_dependencia = $linea['codigo_dependencia'];
						$nombre_dependencia = $linea['nombre_dependencia'];
						$activa = $linea['activa'];
						
						$fecha_modificacion=$linea['fecha_modificacion'];//Fecha que tiene registro en base de datos
						$fecha_creacion = $b->traducefecha($fecha_modificacion);//Trduce la fecha en formato "Domingo 15 de Mayo de 2016"
					
							echo "
						<div id='sugerencia_dependencia' class='art1 ";
							if ($num_fila%2==0) echo " fila2"; //si el resto de la división es 0 pongo un color
							else echo " fila1"; //si el resto de la división NO es 0 pongo otro color 
						echo "'>"; 
	/* Aqui defino cuál va a ser el comportamiento al dar clic sobre el resultado obtenido desde el "a href" */;
							echo "<a href=\"javascript:carga_dependencia('$codigo_dependencia','$nombre_dependencia')\">";

	/*Aqui defino lo que se muestra del resultado obtenido*/						
								echo "
									<div style='padding-left: 5px;'>
										<b>".$codigo_dependencia."</b> ( ".$nombre_dependencia." ) 
									</div>
								</a>";
	/*Hasta aqui debe ir la etiqueta "a href" para que cuando haga clic en cada uno de los resultados*/
				echo "	</div> <!--cierra div class='art1' --> "; 
						$num_fila++; 
					}
				}while ($fila_dependencia=pg_fetch_assoc($fila_dependencia));
			}else{
				if($search_dependencia!=''){
					echo "<script>
						$('#error_dependencia_inexistente').slideDown();
					</script>";
					/*Aqui va lo que quiero mostrar si no hay resultados*/
				}
			}
		}
/* Fin que ajax - sugerencias dependencia Formulario Agregar Usuarios */
	
/*Isset ajax consulta sugerencias - ubicacion Formulario Agregar Usuarios */	
		$search_ubicacion ='';
		if(isset($_POST['search_ubicacion'])){
			$search_ubicacion = $_POST['search_ubicacion'];

			$consulta_ubicacion="SELECT * FROM municipios where UPPER(nombre_departamento) 
			like UPPER('%".$search_ubicacion."%') OR UPPER(nombre_municipio) 
			like UPPER('%".$search_ubicacion."%') order by nombre_municipio limit 5";

			$fila_ubicacion = pg_query($conectado,$consulta_ubicacion);
	/*Calcula el numero de registros que genera la consulta anterior.*/
			$registros_ubicacion= pg_num_rows($fila_ubicacion);

	/* Quita los errores que se visualizan en formulario*/
			echo'<script>
				$("#error_ubicacion").slideUp("slow");
				$("#valida_minimo_ubicacion").slideUp("slow");
				$("#valida_maximo_ubicacion").slideUp("slow");
				$("#error_ubicacion_invalida").slideUp("slow");
			</script>';	

	/*Recorre el array generado e imprime uno a uno los resultados.*/	
			if($registros_ubicacion>0 && $search_ubicacion!=''){
				echo "<script>
					$('#error_ubicacion_inexistente').slideUp();
					$('#sugerencias_ubicacion').slideDown();
				</script>";
				do{
					$num_fila=0;
					for ($i=0;$i<$registros_ubicacion;$i++){
						$linea = pg_fetch_array($fila_ubicacion);

						$nombre_municipio = $linea['nombre_municipio'];
						$nombre_departamento = $linea['nombre_departamento'];
						$nombre_pais = $linea['nombre_pais'];
						$nombre_continente = $linea['nombre_continente'];
						
						$fecha_modificacion=$linea['fecha_modificacion'];//Fecha que tiene registro en base de datos
						$fecha_creacion = $b->traducefecha($fecha_modificacion);//Trduce la fecha en formato "Domingo 15 de Mayo de 2016"
					
							echo "
						<div id='sugerencia_ubicacion' class='art1 ";
							if ($num_fila%2==0) echo " fila2"; //si el resto de la división es 0 pongo un color
							else echo " fila1"; //si el resto de la división NO es 0 pongo otro color 
						echo "'>"; 
	/*Aqui defino cuál va a ser el comportamiento al dar clic sobre el resultado obtenido desde el "a href"*/;
							echo "<a href=\"javascript:carga_ubicacion('$nombre_municipio','$nombre_departamento','$nombre_pais','$nombre_continente')\">";

	/*Aqui defino lo que se muestra del resultado obtenido*/						
								echo "
									<div style='padding-left: 5px;'>
										<b>".$nombre_municipio."</b> ( ".$nombre_departamento." ) | ".$nombre_pais." - ".$nombre_continente." 
									</div>
								</a>";
	/*Hasta aqui debe ir la etiqueta "a href" para que cuando haga clic en cada uno de los resultados*/
				echo "	</div> <!--cierra div class='art1' --> "; 
						$num_fila++; 
					}
				}while ($fila=pg_fetch_assoc($fila));
			}else{
				if($search_ubicacion!=''){
					echo "<script>
						$('#error_ubicacion_inexistente').slideDown();
					</script>";
					/*Aqui va lo que quiero mostrar si no hay resultados*/
				}
			}
		}
/* Fin que ajax - sugerencias ubicacion Formulario Agregar Usuarios */

/* Isset ajax consulta si perfil del usuario esta disponible en la dependencia - Formulario Agregar Usuarios */	
		$search_perfil ='';
		if(isset($_POST['search_perfil_depe_codi'])){
			$search_perfil = $_POST['search_perfil'];
			$search_perfil_depe_codi = $_POST['search_perfil_depe_codi'];

		$consulta_perfil="select * from usuarios where perfil='".$search_perfil."'
		and	codigo_dependencia ='".$search_perfil_depe_codi."' and estado='ACTIVO'";
		
		$fila_perfil = pg_query($conectado,$consulta_perfil);
		$linea = pg_fetch_array($fila_perfil);

		$nombre_usuario_perfil = $linea['nombre_completo'];

		echo "<script>
			$('#user_perfil').html('$nombre_usuario_perfil');
		</script>";

	/* Calcula el numero de registros que genera la consulta anterior. */
		$registros_perfil= pg_num_rows($fila_perfil);

			if($registros_perfil>0){
				if($search_perfil=='USUARIO'){
					echo "<script>	
						$('#error_perfil').slideUp('slow');
					</script>";
				}elseif ($search_perfil=='AUXILIAR_ARCHIVO') {
					echo "<script>	
						$('#error_perfil').slideUp('slow');
					</script>";				
				}else{
					echo "<script>	
							$('#error_perfil').slideDown('slow');
						</script>";	
				}
			}else{
				echo "<script>	
					$('#error_perfil').slideUp('slow');
				</script>";	
			}	
		}
/* Fin ajax consulta si perfil del usuario esta disponible en la dependencia - Formulario Agregar Usuarios */

/******************************************************************************************/
/* Modificar Usuario **********************************************************************/
/******************************************************************************************/

/*Isset ajax consulta sugerencias - Identificacion Formulario Modificar Usuarios */	
		$search_mod_identificacion ='';
		if(isset($_POST['search_mod_id'])){
			$search_mod_identificacion = $_POST['search_mod_id'];
			$search_ant_mod_id=$_POST['search_ant_mod_id'];

		$consulta_mod_identificacion="SELECT * FROM usuarios u inner join dependencias d 
		on u.codigo_dependencia=d.codigo_dependencia 
		WHERE UPPER(documento_usuario) LIKE UPPER('%".$search_mod_identificacion."%') 
		order by u.nombre_completo limit 10";


	/* Si el nombre a modificar es el mismo que tenía, quita los errores */
			if($search_mod_identificacion==$search_ant_mod_id){
				echo"<script>
					$('.art1').slideUp('slow');
					$('#sugerencia_mod_id').slideUp('slow');
				</script>";
			}else{
				echo "<script>
					$('#sugerencia_mod_id').slideDown('slow');					
				</script>";
			}


		$fila_mod_identificacion = pg_query($conectado,$consulta_mod_identificacion);
	/*Calcula el numero de registros que genera la consulta anterior.*/
		$registros_mod_identificacion= pg_num_rows($fila_mod_identificacion);
	/* Quita los errores que se visualizan en formulario*/
		echo'<script>
			$("#error_mod_identificacion").slideUp("slow");
			$("#valida_minimo_mod_identificacion").slideUp("slow");
			$("#valida_maximo_mod_identificacion").slideUp("slow");
			$("#error_mod_identificacion_ya_existe").slideUp("slow");
		</script>';	

	/*Recorre el array generado e imprime uno a uno los resultados.*/	
			if($registros_mod_identificacion>0 && $search_mod_identificacion!=''){
				do{
					$num_fila=0;
					for ($i=0;$i<$registros_mod_identificacion;$i++){
						$linea = pg_fetch_array($fila_mod_identificacion);

						$perfil = $linea['perfil'];
						$codigo_dependencia = $linea['codigo_dependencia'];
						$login = $linea['login'];
						$estado = $linea['estado'];
						$nombre_completo = $linea['nombre_completo'];
						$nivel_seguridad = $linea['nivel_seguridad'];
						$mail_usuario = $linea['mail_usuario'];
						$imagen = $linea['path_foto'];
						$nombre_dependencia=$linea['nombre_dependencia'];
						$fecha_modificacion=$linea['fecha_modificacion'];//Fecha que tiene registro en base de datos
						$fecha_creacion = $b->traducefecha($fecha_modificacion);//Trduce la fecha en formato "Domingo 15 de Mayo de 2016"
					echo "
					<div class='tooltip'>	
						<div id='sugerencia_mod_id' class='art1 ";
							if ($num_fila%2==0) echo " fila2"; //si el resto de la división es 0 pongo un color
							else echo " fila1"; //si el resto de la división NO es 0 pongo otro color 
						echo "'>"; 
	/*Aqui defino cuál va a ser el comportamiento al dar clic sobre el resultado obtenido desde el "a href"*/;
							echo "<a href=\"javascript:valida_mod_identificacion_ya_existe()\">";

	/*Aqui definmod_o lo que se muestra del resultado obtenido*/						
								echo "
									<div style='float:left;'>
										<img src='".$imagen."' height='60' width='50' class='fotos'> 
									</div>
									<div style='padding-left: 60px;'>
										<b>".$nombre_completo."</b> ( ".$login." ) ".$mail_usuario." 
									</div>
									<div style='padding-left:60px;'>
										<span>".$codigo_dependencia." - ".$nombre_dependencia."</span>
									</div>
								</a>";
	/*Hasta aqui debe ir la etiqueta "a href" para que cuando haga clic en cada uno de los resultados*/
				echo "	</div> <!--cierra div class='art1' -->
				  		<span class='tooltiptext'>Usuario se encuentra ".$estado."  con el perfil ".$perfil."<br> Nivel de Seguridad ".$nivel_seguridad." 
				  		</span>
 					</div>"; // Cierra div class='tooltip'
						$num_fila++; 
					}
				}while ($fila_mod_identificacion=pg_fetch_assoc($fila_mod_identificacion));
			}else{
				/*Aqui va lo que quiero mostrar si no hay resultados*/
			}
		}
/* Fin que ajax - sugerencias Identificacion Formulario Modificar Usuarios */	

/*Isset ajax consulta sugerencias - nombre_completo Formulario Modificar Usuarios */	
		$search_mod_nombre_completo ='';
		if(isset($_POST['search_mod_nombre_completo'])){
			$search_mod_nombre_completo = $_POST['search_mod_nombre_completo'];
			$search_ant_mod_nom = $_POST['search_ant_mod_nom'];

		$consulta_mod_nombre_completo="SELECT * FROM usuarios u inner join dependencias d 
		on u.codigo_dependencia=d.codigo_dependencia 
		WHERE UPPER(login) LIKE UPPER('%".$search_mod_nombre_completo."%') 
		or UPPER(nombre_completo) LIKE UPPER('%".$search_mod_nombre_completo."%') order by u.nombre_completo limit 10";

	/* Si el nombre a modificar es el mismo que tenía, quita los errores */
			if($search_mod_nombre_completo==$search_ant_mod_nom){
				echo"<script>
					$('.art1').slideUp('slow');
					$('#sugerencia_mod_nom').slideUp('slow');
				</script>";
			}else{
				echo "<script>
					$('#sugerencia_mod_nom').slideDown('slow');					
				</script>";
			}

		$fila_mod_nombre_completo = pg_query($conectado,$consulta_mod_nombre_completo);
	/*Calcula el numero de registros que genera la consulta anterior.*/
		$registros_mod_nombre_completo= pg_num_rows($fila_mod_nombre_completo);
	/* Quita los errores que se visualizan en formulario*/
		echo'<script>
			$("#error_mod_nombre_completo").slideUp("slow");
			$("#valida_minimo_mod_nombre_completo").slideUp("slow");
			$("#valida_maximo_mod_nombre_completo").slideUp("slow");
			$("#error_mod_nombre_completo_ya_existe").slideUp("slow");
		</script>';	

	/*Recorre el array generado e imprime uno a uno los resultados.*/	
			if($registros_mod_nombre_completo>0 && $search_mod_nombre_completo!=''){
				do{
					$num_fila=0;
					for ($i=0;$i<$registros_mod_nombre_completo;$i++){
						$linea = pg_fetch_array($fila_mod_nombre_completo);

						$perfil = $linea['perfil'];
						$codigo_dependencia = $linea['codigo_dependencia'];
						$login = $linea['login'];
						$estado = $linea['estado'];
						$nombre_completo = $linea['nombre_completo'];
						$nivel_seguridad = $linea['nivel_seguridad'];
						$mail_usuario = $linea['mail_usuario'];
						$imagen = $linea['path_foto'];
						$nombre_dependencia=$linea['nombre_dependencia'];
						$fecha_modificacion=$linea['fecha_modificacion'];//Fecha que tiene registro en base de datos
						$fecha_creacion = $b->traducefecha($fecha_modificacion);//Trduce la fecha en formato "Domingo 15 de Mayo de 2016"
					echo "
					<div class='tooltip'>	
						<div id='sugerencia_mod_nom' class='art1 ";
							if ($num_fila%2==0) echo " fila2"; //si el resto de la división es 0 pongo un color
							else echo " fila1"; //si el resto de la división NO es 0 pongo otro color 
						echo "'>"; 
	/*Aqui defino cuál va a ser el comportamiento al dar clic sobre el resultado obtenido desde el "a href"*/;
							echo "<a href=\"javascript:valida_mod_nombre_completo_ya_existe()\">";

	/*Aqui definmod_o lo que se muestra del resultado obtenido*/						
								echo "
									<div style='float:left;'>
										<img src='".$imagen."' height='60' width='50' class='fotos'> 
									</div>
									<div style='padding-left: 60px;'>
										<b>".$nombre_completo."</b> ( ".$login." ) ".$mail_usuario." 
									</div>
									<div style='padding-left:60px;'>
										<span>".$codigo_dependencia." - ".$nombre_dependencia."</span>
									</div>
								</a>";
	/*Hasta aqui debe ir la etiqueta "a href" para que cuando haga clic en cada uno de los resultados*/
				echo "	</div> <!--cierra div class='art1' -->
				  		<span class='tooltiptext'>Usuario se encuentra ".$estado."  con el perfil ".$perfil."<br> Nivel de Seguridad ".$nivel_seguridad." 
				  		</span>
 					</div>"; // Cierra div class='tooltip'
						$num_fila++; 
					}
				}while ($fila_mod_nombre_completo=pg_fetch_assoc($fila_mod_nombre_completo));
			}else{
				/*Aqui va lo que quiero mostrar si no hay resultados*/
			}
		}
/* Fin que ajax - sugerencias nombre_completo Formulario Modificar Usuarios */	
/*Isset ajax consulta sugerencias - mod_login Formulario Modificar Usuario  */	
		$search_mod_login ='';
		if(isset($_POST['search_mod_login'])){
			$search_mod_login = $_POST['search_mod_login'];
			$search_ant_mod_login=$_POST['search_ant_mod_login'];

		$consulta_mod_login="SELECT * FROM usuarios u inner join dependencias d 
		on u.codigo_dependencia=d.codigo_dependencia 
		WHERE UPPER(login) LIKE UPPER('%".$search_mod_login."%') 
		order by u.nombre_completo limit 10";

	/* Si el nombre a modificar es el mismo que tenía, quita los errores */
			if($search_mod_login==$search_ant_mod_login){
				echo"<script>
					$('.art1').slideUp('slow');
					$('#sugerencias_mod_login').slideUp('slow');
				</script>";
			}else{
				echo "<script>
					$('#sugerencias_mod_login').slideDown('slow');					
				</script>";
			}

		$fila_mod_login = pg_query($conectado,$consulta_mod_login);
	/*Calcula el numero de registros que genera la consulta anterior.*/
		$registros_mod_login= pg_num_rows($fila_mod_login);
	/* Quita los errores que se visualizan en formulario*/
		echo'<script>
			$("#error_mod_login").slideUp("slow");
			$("#valida_minimo_mod_login").slideUp("slow");
			$("#valida_maximo_mod_login").slideUp("slow");
			$("#error_mod_login_ya_existe").slideUp("slow");
		</script>';	

	/*Recorre el array generado e imprime uno a uno los resultados.*/	
			if($registros_mod_login>0 && $search_mod_login!=''){
					echo"<script>
						$('#sugerencia_mod_login').slideDown('slow');
					</script>";	
				do{
					$num_fila=0;
					for ($i=0;$i<$registros_mod_login;$i++){
						$linea = pg_fetch_array($fila_mod_login);

						$perfil = $linea['perfil'];
						$codigo_dependencia = $linea['codigo_dependencia'];
						$login = $linea['login'];
						$estado = $linea['estado'];
						$nombre_completo = $linea['nombre_completo'];
						$usuario_nuevo = $linea['usuario_nuevo'];
						$documento_usuario = $linea['documento_usuario'];
						$sesion = $linea['sesion'];
						$fecha_sesion = $linea['fecha_sesion'];
						$nivel_seguridad = $linea['nivel_seguridad'];
						$mail_usuario = $linea['mail_usuario'];
						$id_usuario = $linea['id_usuario'];
						$imagen = $linea['path_foto'];
						$nombre_dependencia=$linea['nombre_dependencia'];
						$fecha_modificacion=$linea['fecha_modificacion'];//Fecha que tiene registro en base de datos
						$fecha_creacion = $b->traducefecha($fecha_modificacion);//Trduce la fecha en formato "Domingo 15 de Mayo de 2016"
					
							echo "
					<div class='tooltip'>	
						<div id='sugerencia_mod_login' class='art1 ";
							if ($num_fila%2==0) echo " fila2"; //si el resto de la división es 0 pongo un color
							else echo " fila1"; //si el resto de la división NO es 0 pongo otro color 
						echo "'>"; 
	/*Aqui defino cuál va a ser el comportamiento al dar clic sobre el resultado obtenido desde el "a href"*/;
							echo "<a href=\"javascript:valida_mod_login_ya_existe()\">";

	/*Aqui defino lo que se muestra del resultado obtenido*/						
								echo "
									<div style='float:left;'>
										<img src='".$imagen."' height='40' width='40' class='fotos'> 
									</div>
									<div style='padding-left: 50px;'>
										<b>".$nombre_completo."</b> ( ".$login." ) ".$mail_usuario." 
									</div>
									<div style='padding-left:50px;'>
										<span>".$codigo_dependencia." - ".$nombre_dependencia."</span>
									</div>
								</a>";
	/*Hasta aqui debe ir la etiqueta "a href" para que cuando haga clic en cada uno de los resultados*/
				echo "	</div> <!--cierra div class='art1' -->
				  		<span class='tooltiptext'>Usuario se encuentra ".$estado."<br> con el perfil ".$perfil."<br> Nivel de Seguridad ".$nivel_seguridad." 
				  		</span>
 					</div>"; // Cierra div class='tooltip'
						$num_fila++; 
					}
				}while ($fila_mod_login=pg_fetch_assoc($fila_mod_login));
			}else{
				echo"<script>
					$('.art1').slideUp('slow');
					$('#sugerencias_mod_login').slideUp('slow');
				</script>";
				/*Aqui va lo que quiero mostrar si no hay resultados*/
			}
		}
/* Fin que ajax - sugerencias mod_login Formulario Modificar Usuarios */
/*Isset ajax consulta sugerencias - mod_dependencia Formulario Modificar Usuarios */	
		$search_mod_dependencia ='';
		if(isset($_POST['search_mod_dependencia'])){
			$search_mod_dependencia = $_POST['search_mod_dependencia'];
			$mod_ant_mod_nom_depe=$_POST['search_ant_mod_depe'];

			$consulta_mod_dependencia="SELECT * FROM dependencias where UPPER(codigo_dependencia) like UPPER('%".$search_mod_dependencia."%')
			or UPPER(nombre_dependencia) like UPPER('%".$search_mod_dependencia."%') and activa='SI' order by nombre_dependencia limit 5";

			$fila_mod_dependencia = pg_query($conectado,$consulta_mod_dependencia);
	/*Calcula el numero de registros que genera la consulta anterior.*/
			$registros_mod_dependencia= pg_num_rows($fila_mod_dependencia);
	/* Quita los errores que se visualizan en formulario*/
			echo'<script>
				$("#error_mod_dependencia").slideUp("slow");
				$("#valida_minimo_mod_dependencia").slideUp("slow");
				$("#valida_maximo_mod_dependencia").slideUp("slow");
				$("#error_mod_dependencia_invalida").slideUp("slow");
			</script>';	

	/* Recorre el array generado e imprime uno a uno los resultados.*/	
			if($registros_mod_dependencia>0 && $search_mod_dependencia!=''){
				echo "<script>
					$('#error_mod_dependencia_inexistente').slideUp();
					$('#sugerencias_mod_dependencia').slideDown();
				</script>";
				do{
					$num_fila=0;
					for ($i=0;$i<$registros_mod_dependencia;$i++){
						$linea = pg_fetch_array($fila_mod_dependencia);

						$codigo_mod_dependencia = $linea['codigo_dependencia'];
						$nombre_mod_dependencia = $linea['nombre_dependencia'];
						$activa = $linea['activa'];
						
						$fecha_modificacion=$linea['fecha_modificacion'];//Fecha que tiene registro en base de datos
						$fecha_creacion = $b->traducefecha($fecha_modificacion);//Trduce la fecha en formato "Domingo 15 de Mayo de 2016"
					
							echo "
						<div id='sugerencia_mod_dependencia' class='art1 ";
							if ($num_fila%2==0) echo " fila2"; //si el resto de la división es 0 pongo un color
							else echo " fila1"; //si el resto de la división NO es 0 pongo otro color 
						echo "'>"; 
	/* Aqui defino cuál va a ser el comportamiento al dar clic sobre el resultado obtenido desde el "a href" */;
							echo "<a href=\"javascript:carga_mod_dependencia('$codigo_mod_dependencia','$nombre_mod_dependencia')\">";

	/*Aqui defino lo que se muestra del resultado obtenido*/						
								echo "
									<div style='padding-left: 5px;'>
										<b>".$codigo_mod_dependencia."</b> ( ".$nombre_mod_dependencia." ) 
									</div>
								</a>";
	/*Hasta aqui debe ir la etiqueta "a href" para que cuando haga clic en cada uno de los resultados*/
				echo "	</div> <!--cierra div class='art1' --> "; 
						$num_fila++; 
					}
				}while ($fila_mod_dependencia=pg_fetch_assoc($fila_mod_dependencia));
			}else{
				if($search_mod_dependencia!=''){
					echo "<script>
						$('#error_mod_dependencia_inexistente').slideDown();
					</script>";
					/*Aqui va lo que quiero mostrar si no hay resultados*/
				}
			}
		}
/* Fin que ajax - sugerencias mod_dependencia Formulario Modificar Usuarios */
/* Isset ajax consulta si mod_perfil del usuario esta disponible en la dependencia - Formulario Agregar Usuarios */	

		$search_mod_perfil ='';
		if(isset($_POST['search_mod_perfil_depe_codi'])){
			$search_mod_perfil = $_POST['search_mod_perfil'];
			$search_mod_perfil_depe_codi = $_POST['search_mod_perfil_depe_codi'];

		$consulta_mod_perfil="select * from usuarios where perfil='".$search_mod_perfil."'
		and	codigo_dependencia ='".$search_mod_perfil_depe_codi."' and estado='ACTIVO'";

		$fila_mod_perfil = pg_query($conectado,$consulta_mod_perfil);
		$linea = pg_fetch_array($fila_mod_perfil);

		$nombre_usuario_mod_perfil = $linea['nombre_completo'];

		echo "<script>
			$('#user_mod_perfil').html('$nombre_usuario_mod_perfil');
		</script>";

	/* Calcula el numero de registros que genera la consulta anterior. */
		$registros_mod_perfil= pg_num_rows($fila_mod_perfil);

			if($registros_mod_perfil>0){
				if($search_mod_perfil=='AUXILIAR_ARCHIVO'){
				echo "<script>	
						$('#error_mod_perfil').slideUp('slow');
					</script>";				
				}elseif ($search_mod_perfil=='USUARIO') {
					echo "<script>	
						$('#error_mod_perfil').slideUp('slow');
					</script>";	
				}
				else{
					echo "<script>	
						$('#error_mod_perfil').slideDown('slow');
					</script>";
				}
			}else{
				echo "<script>	
						$('#error_mod_perfil').slideUp('slow');
					</script>";
			}	
		}
/* Fin ajax consulta si mod_perfil del usuario esta disponible en la dependencia - Formulario Agregar Usuarios */
?>
</body>
</html>