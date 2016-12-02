<?php

$resultado ="";
$nombre =($_POST["nombre"]);

	$array = array("ana", "anita", "azul", "beto", "baka", "bicho", "carlos","anastasia");

	for($x=0; $x<count($array); $x++){
		if($nombre == $array[$x]){
			$resultado="<p>El nombre $nombre ha sido encontrado</p>";
		} 
	}
	if($resultado ==""){
		echo "<p>El nombre $nombre no ha sido encontrado</p>"
	}else{

			echo "$resultado";
	}


?>