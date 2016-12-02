<?php
session_start();

unset($_SESSION['mi_variable']);

session_destroy();



?>
<a href="mipagina.php" > Volver a mi pagina. </a>