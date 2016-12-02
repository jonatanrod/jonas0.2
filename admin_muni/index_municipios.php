<?php require_once('../login/conexion.php') ?>
<!DOCTYPE html>
<html >
<head>
	<meta charset="UTF-8">
	<title>Buscador de Municipios</title>
	<!--<link href="http://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet" type ="text/css">-->
	<!--<script type="text/javascript" src="include/js/jquery.js"></script>-->
	<script type="text/javascript" src="include/js/funciones_municipios.js"></script>
	<link rel="stylesheet" href="include/css/estilos_municipios.css">
</head>
<body>
<!--Desde aqui el div que contiene el formulario para agregar municipios-->
		<div id="ventana">
			<div class="form">
				<div class="cerrar"><a href='javascript:cerrarVentanaCrearMunicipios();'>Cerrar X</a></div>
				<h1>Formulario Agregar Nuevo Municipio</h1>
				<hr>
				<form action="admin_muni/query_municipios.php" method="post" id ="formulario_agregar_municipio" name ="formulario_agregar_municipio" >
					<table>
						<tr>
							<td>Continente : </td>
							<td>
								<select name="continente" id="continente" onchange="limpia_formulario_agregar()">
									<option value="AFRICA">Africa</option>
									<option value="AMERICA" selected="selected">America</option>
									<option value="ASIA">Asia</option>
									<option value="EUROPA">Europa</option>
									<option value="OCEANIA">Oceania</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>País :</td>
							<td><input type="text" value="Colombia" name="pais" id="pais" onkeyup="espacios_pais() ">
								<div id="sugerencia_pais"></div>
								<div id="error_pais" class="errores">El nombre del país es obligatorio</div>
								<div id="error_pais_invalido" class="errores">Seleccione nombre de país válido</div>
								<div id="error_pais_minimo" class="errores">El nombre de país no puede ser menor a 3 caracteres</div>
								<div id="error_pais_maximo" class="errores">El nombre de país no puede ser mayor a 30 caracteres</div>
							</td>
						</tr>
						<tr>
							<td>Departamento :</td>
							<td><input type="text" placeholder="Digite Departamento" name="departamento" id="departamento" onkeyup="espacios_departamento()">
								<div id="sugerencia_departamento"></div>
								<div id="error_departamento" class="errores">El nombre del departamento es obligatorio</div>
								<div id="error_departamento_invalido" class="errores">Seleccione nombre de departamento válido</div>
								<div id="error_departamento_minimo" class="errores">El nombre de departamento no puede ser menor a 3 caracteres</div>
								<div id="error_departamento_maximo" class="errores">El nombre de departamento no puede ser mayor a 30 caracteres</div>
							</td>
						</tr>
						<tr>
							<td>Municipio :</td>
							<td><input type="text" placeholder="Digite Municipio" name="municipio" id="municipio" onkeyup="espacios_municipio()">
								<div id="sugerencia_municipio"></div>
								<div id="error_municipio" class="errores">El nombre del municipio es obligatorio</div>
								<div id="error_municipio" class="errores">El nombre del municipio es obligatorio</div>
								<div id="error_municipio_invalido" class="errores">Seleccione nombre de municipio válido</div>
								<div id="error_municipio_minimo" class="errores">El nombre de municipio no puede ser menor a 3 caracteres</div>
								<div id="error_municipio_maximo" class="errores">El nombre de municipio no puede ser mayor a 30 caracteres</div>
								<div id="municipio_ya_existe" class="errores"> El nombre del municipio ya existe. No se puede crear.</div>
							</td>
						</tr>
						<tr>
							<td colspan="2"><input type="button" value="Grabar Municipio" id="bEnviar" class="boton_enviar"></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
<!--Hasta aqui el div que contiene el formulario para agregar municipios-->
<!--Desde aqui el div que contiene el formulario para modificar municipios-->	
		<div id="ventana2">
			<div class="form">
				<div class="cerrar"><a href='javascript:cerrarVentanaModificarMunicipios();'>Cerrar X</a></div>
				<h1>Formulario Modificar Municipio</h1>
				<hr>
				<form action="admin_muni/query_municipios.php" method="post" id ="formulario_modificar_municipio" name ="formulario_modificar_municipio" >
					<table>
						<tr>
							<td>Continente : </td>
							<td>
								<input type="hidden" name="ant_continente" id="ant_continente" value=""></input>
								<select name="mod_continente" id="mod_continente" onchange="limpia_formulario_modificacion()">
									<option value="AFRICA">Africa</option>
									<option value="AMERICA">America</option>
									<option value="ASIA">Asia</option>
									<option value="EUROPA">Europa</option>
									<option value="OCEANIA">Oceania</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>País :</td>
							<td>
								<input type="hidden" name="ant_pais" id="ant_pais" value=""></input>
								<input type="text" name="mod_pais" id="mod_pais" onkeyup="espacios_mod_pais()">
								<div id="sugerencia_mod_pais"></div>
								<div id="error_mod_pais" class="errores">El nombre del país es obligatorio</div>
								<div id="error_mod_pais_invalido" class="errores">Seleccione nombre de país válido</div>
								<div id="error_mod_pais_minimo" class="errores">El nombre de país no puede ser menor a 3 caracteres</div>
								<div id="error_mod_pais_maximo" class="errores">El nombre de país no puede ser mayor a 30 caracteres</div>
							</td>
						</tr>
						<tr>
							<td>Departamento :</td>
							<input type="hidden" name="ant_departamento" id="ant_departamento" value=""></input>
							<td><input type="text" placeholder="Digite Departamento" name="mod_departamento" id="mod_departamento" onkeyup="espacios_mod_departamento()">	
								<div id="sugerencia_mod_departamento"></div>			
								<div id="error_mod_departamento" class="errores">El nombre del departamento es obligatorio</div>
								<div id="error_mod_departamento_invalido" class="errores">Seleccione nombre de departamento válido</div>
								<div id="error_mod_departamento_minimo" class="errores">El nombre de departamento no puede ser menor a 3 caracteres</div>
								<div id="error_mod_departamento_maximo" class="errores">El nombre de departamento no puede ser mayor a 30 caracteres</div>
							</td>
						</tr>
						<tr>
							<td>Municipio :</td>
							<td>
								<input type="hidden" name="ant_municipio" id="ant_municipio" value=""></input>
								<input type="text" placeholder="Digite Municipio" name="mod_municipio" id="mod_municipio" onkeyup="espacios_mod_municipio()">
								<div id="sugerencia_mod_municipio"></div>			
								<div id="error_mod_municipio" class="errores">El nombre del municipio es obligatorio</div>
								<div id="error_mod_municipio_invalido" class="errores">El nombre de municipio ya existe. No se puede crear</div>
								<div id="error_mod_municipio_minimo" class="errores">El nombre de municipio no puede ser menor a 3 caracteres</div>
								<div id="error_mod_municipio_maximo" class="errores">El nombre de municipio no puede ser mayor a 30 caracteres</div>
							</td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit" value="Grabar Municipio" id="enviar_mod" class="boton_enviar"></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
<!--Hasta aqui el div que contiene el formulario para modificar municipios-->

		<div class="center" id="logo">
			<img src="imagenes/logo5.png" width="100" alt="Jonas SGD" title="Logo Jonas">	
			<h1 style="margin-top:-10px;">Configuración Paises, Departamentos y Municipios</h1>
		
		</div>
		<div class="form center">
			<!--<form action="" method="post" name="search_form" id="search_form">-->
				<input type="text" id="search">
			<!--</form>-->
		</div>
		<div id="desplegable_resultados"></div>
		<div id="error_ubicacion_contacto" class="errores">La ubicación del contacto que ha digitado no es 
			válida. Este campo es obligatorio. En caso que no encuentre una ubicación correcta, comuníquese
			por favor con el administrador del sistema.</div>
		<div class="footer center">
			Copyright 2015 - Reservados todos los derechos <br>
			<a href="http://www.google.com.co">www.jonas.com.co</a>
		</div>
</body>
</html>