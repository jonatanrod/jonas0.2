<?php 
require_once('../login/conexion.php');
?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Este es el Buscador de Remitente</title>
	<!--<script type="text/javascript" src="../include/js/jquery.js"></script>-->
	<script type="text/javascript" src="include/js/funciones_contactos.js"></script>
	<!--<link href="http://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet" type ="text/css">-->
	<link rel="stylesheet" href="include/css/estilos_entrada.css">
</head>
<body>
	<script>
		$("#dignatario").focus();
	</script>
	<div class="container">
		<div class="cerrar">
			<a href="javascript:atras()">Volver Atras</a>
		</div>
		<span id="titulo_radicacion"><center><h1>Radicación de Entrada</h1></center></span>
		<div class="contenido">
			<hr>
			<strong>Usted esta radicando un documento enviado desde</strong>
			<div class="sugerencia_contacto" style='pading-top:-10'>
				<?php
					$nombre_contacto = $_POST['var1'];
					$nit_contacto = $_POST['var2'];
					$ubicacion_contacto = $_POST['var3'];
					$direccion_contacto = $_POST['var4'];
					$telefono_contacto = $_POST['var5'];
					$mail_contacto = $_POST['var6'];
					$representante_legal = $_POST['var7'];
					$codigo_contacto = $_POST['var8'];
				?>		
				<a href='javascript:abrir_ventana_modifica_remitente();' 
				   title="Clic para cambiar datos del remitente">
					<strong>
						<?php 
							echo "$nombre_contacto ($nit_contacto) <br/>"; 
						?>
					</strong>
					<span>
						<?php 
							echo "$ubicacion_contacto / $direccion_contacto <br/> 
							Telefono : $telefono_contacto / $mail_contacto <br/>";
						?>
					</span> 
				</a> 
			</div> <!--Cierra div class="art"-->
				<strong> Dignatario/Persona que está enviando este radicado </strong>
					
				<input type="text" name="dignatario" id="dignatario" style="padding:5px"
					
					<?php  
						$representante_legal_length = strlen($representante_legal);
						if($representante_legal_length > 1){
							echo "value =' $representante_legal ' ";
						}else{
							echo "placeholder = 'No es necesario para persona Natural' ";
						}
					?>
				title="No aplica para persona natural" class="input_texto">
			<hr>
		</div> <!--Cierra div class="contenido"-->
		<div>
			<table border=0>
				<tr>
					<td rowspan="2">
						Asunto
					</td>
					<td rowspan="2">
						<textarea name="asunto" id="asunto" cols="40" rows="2" style="padding:5px"></textarea>
					</td>
					<td>
						Tipo de Documento
					</td>	
					<td>
						<select name="tipo_documento" id="tipo_documento">
							<option value="DERECHO_PETICION">Derecho de Peticion</option>
							<option value="TUTELA">Tutela</option>
							<option value="OFICIO" selected="selected">Oficio</option>
						</select>
					</td>
				</tr>

				<tr>
					<td>	
						Descripcion de Anexos<br>
					</td>
					<td>
						<input type="text" id="descripcion_anexos" name="descripcion_anexos" style='width:200; padding:5px;' placeholder="Trae anexo CD, AZ, USB, Caja, etc.">
					</td>		
				</tr>
				<tr>
					<td>
						Dependencia Destino
					</td>
					<td colspan="3">
						<input type="text" id="dependencia_destino" name="dependencia_destino" style="width:100%;padding:5px;">
					</td>
				</tr>
			</table>
			<hr>
			<center>
				<input type="button" value="Radicar Documento" id="envia_rad_entrada" class="boton_enviar" style='padding:12px; width: 300px' >
			</center>
		</div>
<!-- Desde aqui inicia la ventana para modificar remitente -->		
		<div id="ventana_modificar_remitente" class="ventana_modal">
			<div class="formulario_modal">
				<div class="cerrar"><a href='javascript:cerrar_ventana_modifica_remitente();'>Cerrar X</a></div>
				<h1>Formulario Modificar Datos del Remitente</h1>
				<hr>
				<form method="post" id ="modifica_datos_contacto" action="radicacion_entrada/query_contactos.php">
					<input type="hidden" name="tipo_formulario" value="modificar_contacto">

					<table border='0'>
						<tr>
							<td>
								Nombre completo (Incluyendo Sigla) :
							</td>
							<td class="celda">
								<input type="text" value="<?php echo $nombre_contacto ?>" id="nombre_contacto_mod" name="nombre_contacto" >
								<input type="hidden" value="<?php echo $nombre_contacto ?>" name="ant_nombre_contacto" id="ant_nombre_contacto">	
								<div id="sugerencia_nombre_contacto_mod"></div>		
								<div id="error_nombre_contacto_mod" class="errores">El nombre del contacto es obligatorio</div>
							</td>
						</tr>
						<tr>
							<td>
								NIT - Identificación :
							</td>
							<td class="celda">
								<input type="text" value="<?php echo $nit_contacto ?>" id="nit_contacto_mod" name="nit_contacto_mod"  onkeyup="espacios_nit_mod()";>
								<input type="hidden" value="<?php echo $nit_contacto ?>" id="ant_nit_contacto" name="ant_nit_contacto">
								<div id="error_nit_contacto_mod" class="errores">El NIT o número de identificación del contacto es obligatorio</div>
								<div id="sugerencia_nit_contacto_mod"></div>
							</td>
						</tr>
						<tr>
							<td>
								Ubicación contacto : 
							</td>
							<td class="celda">
								<input type="text" value= "<?php echo $ubicacion_contacto ?>" id="ubicacion_contacto_mod" name="ubicacion_contacto_mod">
								<input type="hidden" value= "<?php echo $ubicacion_contacto ?>" id="ant_ubicacion_contacto" name="ant_ubicacion_contacto">
								<div id="sugerencia_ubicacion_mod"></div>
								<div id="error_ubicacion_contacto_mod" class="errores">La ubicación del contacto es obligatoria. 
									En caso que no encuentre una ubicación correcta, comuníquese con el administrador del sistema.
								</div>
							</td>
						</tr>
						<tr>
							<td>
								Dirección del contacto :
							</td>
							<td class ="celda">
								<input type="text" value="<?php echo $direccion_contacto ?>" id="direccion_contacto" name="direccion_contacto">
								<input type="hidden" value="<?php echo $direccion_contacto ?>" id="ant_direccion_contacto" name="ant_direccion_contacto">
								<div id="error_direccion_contacto" class="errores">La dirección del contacto es obligatoria</div>
							</td>
						</tr>
						<tr>
							<td>
								Telefono del contacto :
							</td>
							<td class ="celda">
								<input type="text" value="<?php echo $telefono_contacto ?>" id="telefono_contacto" name="telefono_contacto">
								<input type="hidden" value="<?php echo $telefono_contacto ?>" id="ant_telefono_contacto" name="ant_telefono_contacto">
							</td>
						</tr>
						<tr>
							<td>
								Mail del contacto :
							</td>
							<td class ="celda">
								<input type="text" value="<?php echo $mail_contacto ?>" id="email_contacto" name="email_contacto">
								<input type="hidden" value="<?php echo $mail_contacto ?>" id="ant_email_contacto" name="ant_email_contacto">
								<div id="error_email_contacto" class="errores">El email del contacto es obligatorio</div>

							</td>
						</tr>
						<tr>
							<td>
								Representante legal :
							</td>
							<td class ="celda">
								<input type="text" id="representante_legal" name="representante_legal" 					
									<?php  
										$representante_legal_length = strlen($representante_legal);
										if($representante_legal_length > 1){
											echo "value =' $representante_legal ' ";
										}else{
											echo "placeholder = 'No es necesario para persona Natural' ";
										}
									?>
								>
								<input type="hidden" value="<?php echo $ant_representante_legal ?>" id="ant_representante_legal" name="ant_representante_legal">	
							</td>
						</tr>
						<tr>
							<td></td>
							<td><input type="submit" value="Grabar Modificación al Remitente" id="enviar_modificacion_contacto" class="boton_enviar"></td>
						</tr>
					</table>
				</form>
			</div>
		</div><!--Cierra div class"ventana"-->


<!--Desde aqui el div que contiene el formulario para agregar contacto
	<div class="container">-->
		<div class="ventana_modal" id="ventana_agregar_contacto"><!-- ventana-->
			<div class="formulario_modal">
				<div class="cerrar">
					<a href='javascript:cerrarVentanaAgregarContacto();'>Cerrar X
					</a>
				</div>
					<p>
						<h1 id="titulo_formulario">Formulario Agregar Nuevo Contacto</h1>
						<h3 id="subtitulo_formulario">(Entidad - Empresa - Persona Natural)</h3>
					</p>
					<hr>
					<center>	
						<form method="post" id ="form_datos_contacto" action="radicacion_entrada/query_contactos.php">
							<input type="hidden" name="tipo_formulario" value="agregar_nuevo_contacto">
							<table border ="1">
								<tr>
									<td>Nombre completo (Incluyendo Sigla) : </td>
									<td class="celda"><input type="text" placeholder="Digite Nombre" id="nombre_contacto" name="nombre_contacto" onkeyup="espacios_nombre()" onblur="validar_grabar_contacto()">
										<div id="sugerencia_nombre_contacto" class="sugerencia"></div>
										<div id="error_nombre_contacto" class="errores">El nombre del contacto es obligatorio</div>
										<div id="error_min_nombre_contacto" class="errores">El nombre del contacto no puede ser menor a diez caracteres (numeros o letras) </div>
										<div id="error_max_nombre_contacto" class="errores">El nombre del contacto no puede ser mayor a cincuenta caracteres (numeros o letras)</div>										
										<div id="contacto_ya_existe" class="errores">El nombre del contacto ya existe, no es posible crear un nuevo contacto con éste nombre</div>
									</td>
								</tr>
								<tr>
									<td>NIT del contacto :</td>
									<td class ="celda"><input type="text" placeholder="Digite NIT" id="nit_contacto" name="nit_contacto" onkeyup="espacios_nit()" onblur="validar_grabar_contacto()">
										<div id="sugerencia_nit_contacto" class="sugerencia"></div>
										<div id="error_nit_contacto" class="errores">El número de NIT es obligatorio</div>
										<div id="error_min_nit_contacto" class="errores">El número de NIT - RUT del contacto no puede ser menor a diez caracteres (numeros o letras) </div>
										<div id="error_max_nit_contacto" class="errores">El número de NIT - RUT del contacto no puede ser mayor a veinte caracteres (numeros o letras) </div>
										<div id="nit_ya_existe" class="errores">El nombre del contacto ya existe, no es posible crear un nuevo contacto con éste NIT</div>
									</td>
								</tr>
								<tr>
									<td>Ubicación Contacto :</td>
									<td class ="celda"><input type="text" value="BOGOTA(D.C.) COLOMBIA-AMERICA" id="ubicacion_contacto" name="ubicacion_contacto" onkeyup="javascript:this.value=this.value.toUpperCase()" onblur="validar_grabar_contacto()" >
										<div id="sugerencia_ubicacion"></div>
										<div id="error_ubicacion_contacto" class="errores">
											No se han encontrado resultados. Si desea ingresar un nuevo municipio haga click 
											<a href='javascript:carga_administrador_municipios();'>aqui</a>
										</div>
										<div id="error_no_selecciona_ubicacion" class="errores">Seleccione una ubicación válida por favor</div>
									</td>
								</tr>
								<tr>
									<td class = "celda">Dirección del Contacto :</td>
									<td class ="celda"><input type="text" placeholder="Digite Dirección" id="direccion_contacto" name="direccion_contacto" onkeyup="espacios_direccion();">
										<div id="error_direccion" class="errores">La dirección es obligatoria</div>
									</td>
								</tr>
								<tr>
									<td>Teléfono del Contacto :</td>
									<td class ="celda"><input type="text" placeholder="Digite Teléfono" id="telefono_contacto" name="telefono_contacto">
										<div id="error_municipio" class="errores">El número de teléfono es obligatorio</div>
									</td>
								</tr>
								<tr>
									<td>Correo Electrónico del Contacto :</td>
									<td class ="celda">
										<input type="email" placeholder="Digite E-mail" id="email_contacto" name="email_contacto" onkeyup="javascript:this.value=this.value.toUpperCase();" required/>
									</td>
								</tr>
								<tr>
									<td>Representante legal del Contacto :</td>
									<td class="celda">
										<input type="text" placeholder="No aplica para Persona Natural" id="representante_legal_contacto" name="representante_legal_contacto" onkeyup="javascript:this.value=this.value.toUpperCase();">
									</td>
								</tr>
									<td colspan="2">
										<input type="button" value="Crear Contacto" id="grabar_contacto" class="boton_enviar">
									</td>
								</tr>
							</table>
						</form>
					</center>
				</div>
			</div><!--Cierra .formulario_modal -->
		</div><!--Cierra #ventana_agregar_contacto -->
<!--Hasta aqui el div que contiene el formulario para agregar contacto-->


	</div><!--Cierra div class"container"-->





	
</body>
</html>