<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<!--Esta es la parte que se visualiza en la pestaña del navegador-->
	<link rel="shortcut icon" href="imagenes/logo5.png">
	<title>Jonas Principal</title>
	
<!-- Esta es la fuente "Roboto+Condensed que traigo desde googlefonts para la pagina en general " -->
	<link href="http://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet" type ="text/css">
<!--Esta es el href a los archivos que necesito para usar jquery, css-->
<!--	<link rel="stylesheet" href="include/css/estilos_menu_principal.css"> -->
	<script type="text/javascript" src="include/js/jquery.js"></script>
	<script type="text/javascript" src="include/js/funciones_menu.js"></script>

<!-- Esta es la fuente para los iconos -->
	<link rel="stylesheet" href="include/iconos/fonts/style.css">	
</head>

<body style ="margin: 0px">
	<div id="contenedor_general">
<!--Inicio del encabezado de principal3.php-->		
		<div id="encabezado">
		<!--	<div class="logo">Jonas SGD</div> -->
			<div class="boton_menu">
				<a href="#" class="bt-menu"><span class ="icon-menu"> Menu</span></a>
			</div>
			<div class="boton_menu_lateral">
				<a href="#" class="bt-menu"><span class ="icon-menu"> Menu Lateral</span></a>
			</div>
			<nav class="menu_superior">
				<ul style="margin:0px">
					<li class="submenu">
						<a href="#"><span class="icon-grid"></span></a>
						<ul class="children">
							
							<li id="admin_usuarios" onclick="carga_administrador_usuarios()"><a href="#"><span class="icon-users"></span> Usuarios y Perfiles</a></li>
							
							<li id="admin_dependencias" onclick="carga_administrador_dependencias()" ><a href="#"><span class="icon-tree"></span> Dependencias</a></li>
							<!--
							<li><a href="#"><span class="icon-tools"></span> Configuración de Envíos</a></li>
							<li><a href="#"><span class="icon-cogs"></span> Configuración de Devoluciones</a></li>
							-->
							<li id="admin_municipios" onclick="carga_administrador_municipios()"><a href="#"><span class="icon-globe"></span> Configuración Países-Departamentos-Municipios</a></li>
							<!--
							<li><a href="#"><span class="icon-thumbs-up"></span> Generar Paz y Salvo Jonas</a></li>
							-->
						</ul>
					</li>
					<!-- Comento desde aqui porque no se ha desarrollado | Johnnatan Rodriguez 11 Abril
					<li><a href="#"><span class="icon-search"></span></a></li>
					<li><a href="#"><span class="icon-bell"></span></a></li>
					<li><a href="#"><span class="icon-graph"></span></a></li>
					<li class="submenu">
						<a href="#"><span class="icon-user"></span></a>
						<ul class="children">
							<li><a href="#"><span class="icon-child"><span class="titulo_submenu"> Modificar Datos de Usuario</span></span></a></li>
							<li><a href="#"><span class="icon-circle-with-cross"><span class="titulo_submenu"> Cerrar Sesión</span></span></a></li>
						</ul>
					</li>
					Hasta aqui comento porque no se ha desarrollado
					-->
				</ul>
			</nav>
		</div>	
<!--Fin del encabezado de principal3.php-->
<!--Inicio del menu_izquierda de principal3.php-->
		<div id="menu_izquierda">
			<div id="menu_left">
				<nav class="menu_lat">
						<ul>
							<li class="submenu">
								<a href="#"><span class="icon-file-empty"><span class="titulo_submenu"> Radicación </span><span class="caret icon-circle-down"></span></span></a>
								<ul class="children">
									<li onclick ="carga_radicacion_entrada()"><a href="#"><span class="icon-sign-in"></span> Radicación de Entrada</a></li>
								<!-- Comento desde aqui porque no se ha desarrollado | Johnnatan Rodriguez 11 Abril 
									<li><a href="#"><span class="icon-sign-out"></span> Radicación de Salida</a></li>
									<li><a href="#"><span class="icon-cycle"></span> Radicación Interna</a></li>
									<li><a href="#"><span class="icon-add-to-list"></span> Radicación Masiva</a></li>
								</ul>
							</li>
							<li class="submenu">
								<a href="#"><span class="icon-link"><span class="titulo_submenu"> Asociar Imagen</span><span class="caret icon-circle-down"></span></span></a>
								<ul class="children">
									<li><a href="#"><span class="icon-file-settings"> Imagen Principal</span></a></li>
									<li><a href="#"><span class="icon-file-add"><span class="titulo_submenu"> Asociar Imagen Como Anexo</span></span></a></li>
								</ul>
							</li>
							<li class="submenu">
								<a href="#"><span class="icon-email"><span class="titulo_submenu"> Envíos</span><span class="caret icon-circle-down"></span></span></a>
								<ul class="children">
									<li><a href="#"><span class="icon-envelope"><span class="titulo_submenu"> Envío de Correo</span></span></a></li>
									<li><a href="#"><span class="icon-email2"><span class="titulo_submenu"> Devoluciones de Correo</span></span></a></li>
									<li><a href="#"><span class="icon-clipboard"><span class="titulo_submenu"> Impresión de Plantillas</span></span></a></li>
								</ul>
							</li>
							<li><a href="#"><span class="icon-new-message"><span class="titulo_submenu"> Modificación</span></span></a></li>
							Hasta aqui comento porque no se ha desarrollado
							-->
						</ul>
					<!-- Comento porque no se ha desarrollado todavía. Johnnatan Rodriguez 11 Abril
					<div class="bandejas">		
						<ul>
							<li><a href="#"><span class="icon-align-left"><span class="titulo_submenu"> Bandeja de Entrada</span></span></a></li>
							<li><a href="#"><span class="icon-align-right"><span class="titulo_submenu"> Bandeja de Salida</span></span></a></li>
							<li><a href="#"><span class="icon-info"><span class="titulo_submenu"> Documentos Informados</span></span></a></li>
						</ul>
					</div>
					-->
				</nav>
			</div>
		</div><!--Fin del menu_izquierda de principal3.php-->
<!--Inicio del contenido de principal2.php-->
		<div id="contenido" style="padding-left:10px; padding-right:10px;">
			Contenido
		</div>
<!--Fin del contenido de principal2.php-->
	</div> <!--Fin del contenedor_general-->
</body>
</html>
