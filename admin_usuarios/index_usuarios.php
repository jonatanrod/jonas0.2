<?php 
	require_once("../login/validar_inactividad.php");
	//require_once('../login/conexion2.php') 
?>
<!DOCTYPE html>
<html > 
<head>
	<meta charset="UTF-8">
	<title>Buscador de Usuarios</title>
	<script type="text/javascript" src="include/js/funciones_usuarios.js"></script>
	<link rel="stylesheet" href="include/css/estilos_usuarios.css">
</head>
<body>
<!--Desde aqui el div que contiene el formulario para agregar usuarios-->
		<div id="ventana">
			<div class="formulario">
				<div class="cerrar"><a href='javascript:cerrarVentanaCrearUsuarios();'>Cerrar X</a></div>
				<h1>Formulario Agregar Nuevo Usuario</h1>
				<hr>
				<form enctype="multipart/form-data" action="admin_usuarios/query_usuarios.php" method="POST" id ="formulario_agregar_usuario" name ="formulario_agregar_usuario" autocomplete="off">
					<input type="hidden" name="tipo_formulario" id="tipo_formulario" value="crear_usuario">
					<input type="hidden" name="MAX_FILE_SIZE" value="3000000" />
					<table>
						<tr>
							<td width="40%">
								Identificacion :
							</td>
							<td>
								<input type="text" name="identificacion" id="identificacion"
								 placeholder="Ingrese Numero Identificacion (sin puntos)" onkeyup="espacios_identificacion()">
								<div id="sugerencias_identificacion"></div>

								<div id="error_identificacion" class="errores">El número de identificación es obligatorio.</div>
								<div id="valida_minimo_identificacion" class="errores">El numero de identificación no puede ser menor a 6 caracteres (numeros sin puntos.)</div>
								<div id="valida_maximo_identificacion" class="errores">El numero de identificación no puede ser mayor a 20 caracteres (numeros sin puntos.)</div>
								<div id="error_identificacion_ya_existe" class="errores">
									El número de identificación ingresado corresponde a un usuario que ya existe por lo que no se puede crear.
								</div>
								<div id="error_no_es_numero" class="errores">En este campo solo puede ingresar numeros (sin puntos ni guiones).</div>
							</td>
						</tr>	
						<tr>
							<td>
								Nombre Completo :
							</td>
							<td>
								<input type="text" name="nombre_completo" id="nombre_completo" placeholder="Ingrese Nombres y Apellidos completos (sin numeros)" onkeyup="espacios_nombre_completo()">
								<div id="sugerencias_nombre_completo"></div>

								<div id="error_nombre_completo" class="errores">El nombre completo del usuario es obligatorio.</div>
								<div id="valida_minimo_nombre_completo" class="errores">El nombre  del usuario (con apellido) no puede ser menor a 6 caracteres (sin numeros)</div>
								<div id="valida_maximo_nombre_completo" class="errores">El nombre completo del usuario no puede ser mayor a 50 caracteres (sin numeros.)</div>
								<div id="error_nombre_completo_ya_existe" class="errores">
									El nombre ingresado corresponde a un usuario que ya existe por lo que no se puede crear.
								</div>
							</td>
						</tr>
						<tr>
							<td>
								Nombre de Usuario (Login) :
							</td>
							<td>
								<input type="text" name="login" id="login" placeholder="Ingrese Login del usuario" onkeyup="espacios_login()">
								<div id="sugerencias_login"></div>

								<div id="error_login" class="errores">El Login del usuario es obligatorio.</div>
								<div id="valida_minimo_login" class="errores">El Login del usuario no puede ser menor a 6 caracteres (sin numeros)</div>
								<div id="valida_maximo_login" class="errores">El Login del usuario no puede ser mayor a 30 caracteres (sin numeros.)</div>
								<div id="error_login_ya_existe" class="errores">
									El Login ingresado corresponde a un usuario que ya existe por lo que no se puede crear.
								</div>
							</td>
						</tr>		
						<tr>
							<td>
								Mail Usuario
							</td>
							<td>
								<input type="text" name="mail" id="mail" placeholder="Ingrese Mail del Usuario" onkeyup="espacios_mail()">

								<div id="error_mail" class="errores">El mail del usuario es obligatorio.</div>
								<div id="valida_minimo_mail" class="errores">El mail del usuario no puede ser menor a 6 caracteres.</div>
								<div id="valida_maximo_mail" class="errores">El mail del usuario no puede ser mayor a 30 caracteres.</div>
								<div id="error_mail_formato" class="errores">
									El mail ingresado no tiene formato correcto (usuario@algunmail.com) por lo que no se puede crear.
								</div>
							</td>
						</tr>
						<tr>
							<td>
								Dependencia :
							</td>
							<td>
								<input type="hidden" name="codigo_dependencia" id="codigo_dependencia">
								<input type="text" name="dependencia" id="dependencia" placeholder="Ingrese Dependencia del Usuario" onkeyup="espacios_dependencia()">
								<div id="sugerencias_dependencia"></div>

								<div id="error_dependencia" class="errores">La dependencia del usuario es obligatoria.</div>
								<div id="valida_minimo_dependencia" class="errores">La dependencia del usuario no puede ser menor a 6 caracteres.</div>
								<div id="valida_maximo_dependencia" class="errores">La dependencia del usuario no puede ser mayor a 50 caracteres.</div>
								<div id="error_dependencia_inexistente" class="errores">La dependencia ingresada no existe en la base de datos.</div>
								<div id="error_dependencia_invalida" class="errores">Por favor seleccione una dependencia válida.</div>
							</td>
						</tr>
						<tr>
							<td>Perfil : </td>
							<td>
								<select name="perfil" id="perfil" onchange="valida_perfil()">
									<option value="ADMINISTRADOR_SISTEMA">Administrador del Sistema</option>
									<option value="JEFE_DEPENDENCIA">Jefe de la Dependencia (Vo.Bo.)</option>
									<option value="DISTRIBUIDOR_DEPENDENCIA">Distribuidor de la Dependencia</option>
									<option value="JEFE_ARCHIVO">Jefe de Archivo</option>
									<option value="AUXILIAR_ARCHIVO">Auxiliar Archivo</option>
									<option value="USUARIO" selected="selected">Usuario</option>		
								</select>
								<div id="sugerencias_perfil"></div>
								<div id="error_perfil" class="errores">
									En la dependencia <strong id="depe_perfil"></strong> ya existe un usuario con el perfil <strong id="perfil_p"></strong> : <br> <strong id="user_perfil"></strong> 
								</div>
							</td>
						</tr>
						<tr>
							<td>Foto del Usuario</td>
							<td>
								<input type="file" name="imagen" id="imagen" onchange="valida_tipo_archivo()">
								<div id="error_imagen" class="errores">La imagen del usuario es obligatoria</div>
								<div id="error_imagen_invalida" class="errores"> El formato de la imagen que va a ingresar no es válido. El sistema solo admite formato PNG, GIF, JPG y JPEG</div>
							</td>
						</tr>
					</table>
					<hr>
					<h2> Permisos del Usuario</h2>
					<hr>	
					<table>
						<tr>	
							<td border="5">
								Estado :
							</td>
							<td border="5">	
								<select name="estado" id="estado">
									<option value="ACTIVO">Activo</option>
									<option value="INACTIVO">Inactivo</option>
								</select>
							</td>
					<!--</tr>	
						<tr>	
					-->		<td>
								Contraseña Nueva
							</td>
							<td>	
								<select name="usuario_nuevo" id="usuario_nuevo">
									<option value="SI">SI</option>
									<option value="NO">NO</option>
								</select>
							</td>
						</tr>
						
						<tr>
							<td>								
								Nivel Seguridad
							</td>
							<td>
								<select name="nivel_seguridad" id="nivel_seguridad">
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
								</select>
							</td>
					<!--</tr>	
						<tr>
					-->		<td>Ventanilla de Radicacion</td>
							<td>
								<select name="ventanilla_radicacion" id="ventanilla_radicacion">
									<option value="SI">SI</option>
									<option value="NO" selected="selected">NO</option>
								</select>
							</td>
						</tr>
						<tr>
							<td colspan="3">
								<center>
									<input type="button" value="Crear Usuario" id="bCrearUsuario" class="boton_enviar"></td>
								</center>	
						</tr>
					</table>	
				</form>
			</div><!-- Cierra el div class ="formulario" -->		
		</div><!-- Cierra el div id='ventana' -->
<!--Hasta aqui el div que contiene el formulario para agregar municipios-->
<!--**************************************************************************************************-->
<!--Desde aqui el div que contiene el formulario para modificar usuarios-->	
		<div id="ventana2">
			<div class="form">
				<div class="cerrar"><a href='javascript:cerrarVentanaModificarUsuarios();'>Cerrar X</a></div>
				<h1>Formulario Modificar Usuario</h1>
				<hr>
				<form enctype="multipart/form-data" action="admin_usuarios/query_usuarios.php" method="POST" id ="formulario_modificar_usuario" name ="formulario_modificar_usuario" autocomplete="off">		
					<input type="hidden" name="tipo_formulario" id="tipo_formulario" value="modificar_usuario">		
					<input type="hidden" name="MAX_FILE_SIZE" value="3000000" />
					<table>
						<tr>
							<td width="40%">
								Identificacion :
							</td>
							<td>
								<input type="hidden" name="mod_id_usuario" id="mod_id_usuario">
								<input type="hidden" name="ant_mod_identificacion" id="ant_mod_identificacion">
								<input type="text" name="mod_identificacion" id="mod_identificacion"
								 placeholder="Ingrese Numero Identificacion (sin puntos)" onkeyup="espacios_mod_identificacion()">
								<div id="sugerencias_mod_identificacion"></div>

								<div id="error_mod_identificacion" class="errores">El número de identificación es obligatorio.</div>
								<div id="valida_minimo_mod_identificacion" class="errores">El numero de identificación no puede ser menor a 6 caracteres (numeros sin puntos.)</div>
								<div id="valida_maximo_mod_identificacion" class="errores">El numero de identificación no puede ser mayor a 20 caracteres (numeros sin puntos.)</div>
								<div id="error_mod_identificacion_ya_existe" class="errores">
									El número de identificación ingresado corresponde a un usuario que ya existe por lo que no se puede crear.
								</div>
								<div id="error_no_es_mod_numero" class="errores">En este campo solo puede ingresar numeros (sin puntos ni guiones).</div>
							</td>
						</tr>	
						<tr>
							<td>
								Nombre Completo :
							</td>
							<td>
								<input type="hidden" name="ant_mod_nombre_completo" id="ant_mod_nombre_completo">
								<input type="text" name="mod_nombre_completo" id="mod_nombre_completo" placeholder="Ingrese Nombres y Apellidos completos (sin numeros)" onkeyup="espacios_mod_nombre_completo()">
								<div id="sugerencias_mod_nombre_completo"></div>

								<div id="error_mod_nombre_completo" class="errores">El nombre completo del usuario es obligatorio.</div>
								<div id="valida_minimo_mod_nombre_completo" class="errores">El nombre  del usuario (con apellido) no puede ser menor a 6 caracteres (sin numeros)</div>
								<div id="valida_maximo_mod_nombre_completo" class="errores">El nombre completo del usuario no puede ser mayor a 30 caracteres (sin numeros.)</div>
								<div id="error_mod_nombre_completo_ya_existe" class="errores">
									El nombre ingresado corresponde a un usuario que ya existe por lo que no se puede crear.
								</div>
							</td>
						</tr>
						<tr>
							<td>
								Nombre de Usuario (Login) :
							</td>
							<td>
								<input type="hidden" name="ant_mod_login" id="ant_mod_login">
								<input type="text" name="mod_login" id="mod_login" placeholder="Ingrese Login del usuario" onkeyup="espacios_mod_login()">
								<div id="sugerencias_mod_login"></div>

								<div id="error_mod_login" class="errores">El Login del usuario es obligatorio.</div>
								<div id="valida_minimo_mod_login" class="errores">El Login del usuario no puede ser menor a 6 caracteres (sin numeros)</div>
								<div id="valida_maximo_mod_login" class="errores">El Login del usuario no puede ser mayor a 30 caracteres (sin numeros.)</div>
								<div id="error_mod_login_ya_existe" class="errores">
									El Login ingresado corresponde a un usuario que ya existe por lo que no se puede crear.
								</div>
							</td>
						</tr>		
						<tr>
							<td>
								Mail Usuario
							</td>
							<td>
								<input type="text" name="mod_mail" id="mod_mail" placeholder="Ingrese Mail del Usuario" onkeyup="espacios_mod_mail()">

								<div id="error_mod_mail" class="errores">El mail del usuario es obligatorio.</div>
								<div id="valida_minimo_mod_mail" class="errores">El mail del usuario no puede ser menor a 6 caracteres.</div>
								<div id="valida_maximo_mod_mail" class="errores">El mail del usuario no puede ser mayor a 30 caracteres.</div>
								<div id="error_mod_mail_formato" class="errores">
									El mail ingresado no tiene formato correcto (usuario@algunmail.com) por lo que no se puede crear.
								</div>
							</td>
						</tr>
						<tr>
							<td>
								Dependencia :
							</td>
							<td>
								<input type="hidden" name="mod_codigo_dependencia" id="mod_codigo_dependencia">
								<input type="hidden" name="mod_ant_mod_nom_depe" id="mod_ant_mod_nom_depe">
								<input type="text" name="mod_nombre_dependencia" id="mod_nombre_dependencia" placeholder="Ingrese Dependencia del Usuario" onkeyup="espacios_mod_dependencia()">
								<div id="sugerencias_mod_dependencia"></div>

								<div id="error_mod_dependencia" class="errores">La dependencia del usuario es obligatoria.</div>
								<div id="valida_minimo_mod_dependencia" class="errores">La dependencia del usuario no puede ser menor a 6 caracteres.</div>
								<div id="valida_maximo_mod_dependencia" class="errores">La dependencia del usuario no puede ser mayor a 50 caracteres.</div>
								<div id="error_mod_dependencia_inexistente" class="errores">La dependencia ingresada no existe en la base de datos.</div>
								<div id="error_mod_dependencia_invalida" class="errores">Por favor seleccione una dependencia válida.</div>
							</td>
						</tr>
						<tr>
							<td>Perfil : </td>
							<td>
								<select name="mod_perfil" id="mod_perfil" onchange="valida_mod_perfil()">
									<option value="ADMINISTRADOR_SISTEMA">Administrador del Sistema</option>
									<option value="JEFE_DEPENDENCIA">Jefe de la Dependencia (Vo.Bo.)</option>
									<option value="DISTRIBUIDOR_DEPENDENCIA">Distribuidor de la Dependencia</option>
									<option value="JEFE_ARCHIVO">Jefe de Archivo</option>
									<option value="AUXILIAR_ARCHIVO">Auxiliar Archivo</option>
									<option value="USUARIO" selected="selected">Usuario</option>		
								</select>
								<div id="sugerencias_mod_perfil"></div>
								<div id="error_mod_perfil" class="errores">
									En la dependencia <strong id="depe_mod_perfil"></strong> ya existe un usuario con el perfil <strong id="mod_perfil_p"></strong> : <br> <strong id="user_mod_perfil"></strong> 
								</div>
							</td>
						</tr>
						<tr>
							<td>Foto del Usuario</td>
							<td>
								<input type="file" name="imagen2" id="imagen2" onchange="valida_mod_tipo_archivo()">
								<div id="error_mod_imagen_invalida" class="errores"> El formato de la imagen que va a ingresar no es válido. El sistema solo admite formato PNG, GIF, JPG y JPEG</div>
							</td>
						</tr>
					</table>
					<hr>
					<h2> Permisos del Usuario</h2>
					<hr>	
					<table>
						<tr>	
							<td>
								Estado :
							</td>
							<td>	
								<select name="mod_estado" id="mod_estado">
									<option value="ACTIVO">Activo</option>
									<option value="INACTIVO">Inactivo</option>
								</select>
							</td>
						<!--</tr>	
						<tr>
						-->	<td>
								Contraseña Nueva
							</td>
							<td>	
								<select name="mod_usuario_nuevo" id="mod_usuario_nuevo">
									<option value="SI">SI</option>
									<option value="NO">NO</option>
								</select>
							</td>
						</tr>
						
						<tr>
							<td>								
								Nivel Seguridad
							</td>
							<td>
								<select name="mod_nivel_seguridad" id="mod_nivel_seguridad">
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
								</select>
							</td>
						<!--</tr>	
						<tr>
						-->	<td>Ventanilla de Radicacion</td>
							<td>
								<select name="mod_ventanilla_radicacion" id="mod_ventanilla_radicacion">
									<option value="SI">SI</option>
									<option value="NO" selected="selected">NO</option>
								</select>
							</td>
						</tr>
						<tr>
							<td colspan="4">
								<center>
									<input type="button" value="Modificar Usuario" id="bModificarUsuario" class="boton_enviar">
								</center>
							</td>
						</tr>
					</table>		
				</form>
			</div>
		</div>
<!--Hasta aqui el div que contiene el formulario para modificar usuarios-->

<!-- Desde aqui el div que tiene el formulario principal -->
		<div class="center" id="logo">
			<img src="imagenes/logo5.png" width="100" alt="Jonas SGD" title="Logo Jonas">	
			<h1 style="margin-top:-10px;">Configuración Usuarios </h1>
		
		</div>
		<div class="form center">
			<input type="text" id="search_usuario" class="input_largo">
		</div>
		<div id="desplegable_resultados"></div>

		<div class="footer center">
			Copyright 2015 - Reservados todos los derechos <br>
			<a href="http://www.google.com.co">www.jonas.com.co</a>
		</div>
<!-- Hasta aqui el div que tiene el formulario principal -->
</body>
</html>