<?php
	$host = "localhost";
	$puerto = "5432";
	$dbname = "jonas_log2";
	$user = "admin"; // En version Casa
//	$user = "postgres"; // En version ejercito	
	$password = "orfeo"; // En version Casa
//	$password = "jonas"; // En version ejercito
	$conectado_log = pg_connect("host=$host port=$puerto dbname = $dbname user= $user password = $password") 
				or die 
				("No pude conectarme con la base de datos 2, revisa las variables de conexión por favor.");
?>