<?php 
	require_once("../login/validar_inactividad.php");
	//require_once('../login/conexion2.php') 
?>
<!DOCTYPE html>
<html >
<head>
	<meta charset="UTF-8">
	<title>Buscador de Dependencias</title>
	<script type="text/javascript" src="include/js/funciones_dependencias.js"></script>
	<link rel="stylesheet" href="include/css/estilos_dependencias.css">
</head>
<body>
<!--Desde aqui el div que contiene el formulario para agregar municipios-->
	<div class="container">
		<div id="ventana">
			<div class="form">
				<div class="cerrar"><a href='javascript:cerrarVentanaCrearDependencia();'>Cerrar X</a></div>
				<h1>Formulario Agregar Nueva Dependencia</h1>
				<hr>
				<form action="admin_depe/query_dependencias.php" method="post" id ="formulario_agregar_dependencia" name ="formulario_agregar_dependencia" >
					<table border ="0">
						<tr>
							<td class="input_text">Codigo de la Dependencia (Letra o Numero) :</td>
							<td>
							<input type="hidden" name ="tipo_formulario" id="tipo_formulario" value="crear_dependencia"><!-- Tipo de formulario para query_dependencias.php -->
								<input type="search" placeholder="Digite Codigo Dependencia Alfanumerico" name="codigo_dependencia" id="codigo_dependencia" onkeyup="espacios_codigo_dependencia()" onblur="validar_grabar_dependencia()" maxlength="3" >
								<div id="sugerencia_codigo_dependencia"></div>
								
								<div id="codigo_dependencia_ya_existe" class="errores">El codigo de la dependencia ya existe, no es posible crear una nueva dependencia con éste código</div>								
								<div id="error_codigo_dependencia" class="errores">El codigo de la dependencia es obligatoria</div>
								<div id="valida_minimo_codigo" class="errores">El codigo de la dependencia no puede ser menor a tres caracteres (numeros o letras)</div>
							</td>
						</tr>
						<tr>
							<td class="input_text">Nombre de la Dependencia :</td>
							<td>
								<input type="search" placeholder="Digite Nombre de la dependencia" name="nombre_dependencia" id="nombre_dependencia" onkeyup="espacios_formulario_dependencia('nombre_dependencia')" onblur="validar_grabar_dependencia()">
								<div id="sugerencia_nombre_dependencia" class="sugerencia"></div>
								<div id="nombre_dependencia_ya_existe" class="errores">El nombre de la dependencia ya existe, no es posible crear una nueva dependencia con éste nombre</div>								
								<div id="error_nombre_dependencia" class="errores">El nombre de la dependencia es obligatoria</div>
								<div id="valida_minimo_nombre" class="errores">El nombre de la dependencia no puede ser menor a 6 caracteres (numeros o letras)</div>
								<div id="valida_maximo_nombre" class="errores">El nombre de la dependencia no puede ser mayor a 40 caracteres (numeros o letras)</div>		
							</td>
						</tr>
						<tr>
							<td class="input_text">Dependencia Padre :</td>
							<td>
								<input type="search" placeholder="Digite Dependencia Padre (Si tiene)" name="dependencia_padre" id="dependencia_padre" onkeyup="espacios_formulario_dependencia('dependencia_padre')" >							
								<div id="sugerencia_dependencia_padre" class="sugerencia"></div>
								<div id="error_nombre_dependencia_padre" class="errores">El nombre de la dependencia padre no existe en la base de datos. Intente otro nombre</div>
								<div id="error_nombre_dependencia_padre2" class="errores">Por favor seleccione una dependencia padre válida</div>
							</td>
						</tr>
						<tr>
							<td colspan="2"><center><input type="button" value="Grabar Dependencia" id="bEnviar_depe" class="boton_enviar"><center></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
<!--Hasta aqui el div que contiene el formulario para agregar Dependencia-->
<!--Desde aqui el div que contiene el formulario para Modificar Dependencia-->	
		<div id="ventana2">
			
			<div class="form">
				<div class="cerrar"><a href='javascript:cerrarVentanaModificarDependencia();'>Cerrar X</a></div>
				<h1>Formulario Modificar Dependencia</h1>
				<hr>
				<form action="admin_depe/query_dependencias.php" method="post" id ="formulario_modificar_dependencia" name ="formulario_modificar_dependencia" >
					<table>
						<tr>
							<td class="input_text">Codigo de la Dependencia (Letra o Numero) :</td>
								<input type="hidden" name ="id_dependencia" id="id_dependencia">
								<input type="hidden" name ="tipo_formulario" id="tipo_formulario" value="modificar_dependencia"><!--Tipo de formulario para query_dependencias.php-->
								<input type="hidden" name ="antiguo_mod_padre" id="antiguo_mod_padre">
							<td>
								<input type="text" name="mod_codigo_dependencia" id="mod_codigo_dependencia" title="Este campo no se puede modificar" class="readonly" readonly >
							</td>
						</tr>
						<tr>
							<td class="input_text">Nombre de la Dependencia :</td>
							<td>
								<input type="search" placeholder="Digite Nombre de la dependencia" name="mod_nombre_dependencia" id="mod_nombre_dependencia" onkeyup="espacios_formulario_dependencia('mod_nombre_dependencia')" onblur="validar_modificar_dependencia()">
								<input type="hidden" name="antiguo_nombre_dependencia" id="antiguo_nombre_dependencia">
								<div id="sugerencia_mod_nombre_dependencia" class="sugerencia"></div>
								<div id="mod_dependencia_ya_existe" class="errores">El nombre de la dependencia ya existe, no es posible modificar una nueva dependencia asignando éste nombre</div>								
								<div id="error_mod_nombre_dependencia" class="errores">El nombre de la dependencia es obligatorio</div>
								<div id="valida_minimo_mod_nombre" class="errores">El nombre de la dependencia no puede ser menor a 6 caracteres (numeros o letras)</div>
								<div id="valida_maximo_mod_nombre" class="errores">El nombre de la dependencia no puede ser mayor a 50 caracteres (numeros o letras)</div>
							</td>
						</tr>
						<tr>
							<td class="input_text">Dependencia Padre :</td>
							<td>
								<input type="search" placeholder="Digite Dependencia Padre (Si tiene)" name="mod_dependencia_padre" id="mod_dependencia_padre" onkeyup="espacios_formulario_dependencia('mod_dependencia_padre')" onblur="validar_modificar_dependencia()">							
								<div id="sugerencia_dependencia_mod_padre" class="sugerencia"></div>
								<div id="error_nombre_mod_dependencia_padre" class="errores">El nombre de la dependencia no existe en la base de datos. Intente otro nombre</div>
								<div id="error_nombre_mod_dependencia_padre2" class="errores">Por favor seleccione una dependencia padre válida</div>
								<div id="error_nombre_mod_dependencia_padre3" class="errores">La dependencia padre no puede ser el mismo nombre de la dependencia que se está creando.</div>
							</td>
						</tr>
						
						<tr>
							<td class="input_text">Activa :</td>
							<td>
								<select name="mod_activa" id="mod_activa">
<!--									<option value="SI" selected="selected">SI</option>-->
									<option value="SI">SI</option>
									<option value="NO">NO</option>
								</select>
							</td>
						</tr>
						<tr>
							<td colspan="2"><center><input type="button" value="Modificar Dependencia" id="enviar_mod_dependencia" class="boton_enviar"><center></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
<!--Hasta aqui el div que contiene el formulario para modificar Dependencia -->

		<div class="center" id="logo">
			<br>
			<img src="imagenes/logo5.png" width="100" alt="Jonas SGD" title="Logo Jonas">
			<h1 style="margin-top:-10px;">Configuración Dependencias</h1>
			
		</div>
		<div class="form center">
				<input type="search" id="search_dependencias">
		</div>
		<div id="desplegable_resultados"></div>
		<div id="error_dependencias" class="errores">La dependencia que ha digitado no se encuentra en la base de datos.
			Este campo es obligatorio. En caso que no encuentre una dependencia correcta, comuníquese
			por favor con el administrador del sistema.</div>
		<div class="footer center">
			Copyright 2015 - Reservados todos los derechos <br>
			<a href="http://www.google.com.co">www.jonas.com.co</a>
		</div>
	</div>

</body>
</html>