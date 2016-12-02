<?php
session_start();
if(isset($_SESSION["mi_variable"])){
echo "Mostrar mi variable: " . $_SESSION["mi_variable"];
}else{
	echo "No hay ninguna variable creada";
}



?>
<br/><br/>
<a href= "salir.php" > Borrar mis variables de sesion  </a>
<br/><br/><a href= "infophp.php" > Volver a crear mis variables de sesion . </a>




<li><a href="#"><span class=icon-></span>Radicacion</a></li>
				<li><a href="#"><span class=icon-></span>Asociar Imagen</a></li>
				<li><a href="#"><span class=icon-></span>Envíos</a></li>
				<li><a href="#"><span class=icon-></span>Modificación</a></li>
				<li><a href="#"><span class=icon-></span>Bandeja de Entrada</a></li>
				<li><a href="#"><span class=icon-></span>Bandeja de Salida</a></li>
				<li><a href="#"><span class=icon-></span>Documentos Informados</a></li>