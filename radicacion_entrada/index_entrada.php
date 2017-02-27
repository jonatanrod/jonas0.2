<?php 
require_once('../login/conexion.php');?>
<!DOCTYPE html>
<html >
<head>
	<meta charset="UTF-8">
	<title>Buscador de Remitente</title>
	<!--<script type="text/javascript" src="include/js/jquery.js"></script>-->
	<script type="text/javascript" src="include/js/funciones_contactos.js"></script>
	<!--<link href="http://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet" type ="text/css">-->
	<link rel="stylesheet" href="include/css/estilos_entrada.css">
</head>
<body>
<!--Desde aqui el div que contiene el formulario para agregar contacto-->
	<div class="container">
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

<!--Desde aqui los div que se muestran por default al cargar index_entrada.php-->
		<div class="center" id="logo">
			<br>
			<img src="imagenes/logo5.png" width="100" alt="Jonas SGD" title="Logo Jonas">
			<h1 style="margin-top:-10px;">Módulo de radicación de entrada</h1>		
		</div>
		<div class="formulario_modal center">
			 <input type="text" name ="search_remitente" id="search_remitente">
		</div>
		<div id="sugerencias_remitente"></div><br/> 
		<div class="footer center">
			Copyright 2015 - Reservados todos los derechos <br>
			<a href="http://www.google.com.co">www.jonas.com.co</a>
		</div>
<!--Hasta aqui los div que se muestran por default al cargar index_entrada.php-->		
	</div><!--Cierra .container -->

</body>
</html>