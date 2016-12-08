<?php 
    session_start();

    include ("conexion.php");
   
    $isql ="select * from usuarios where login = trim(upper('$user_j')) and pass = md5('$passd_j')";
    
        $resultado = pg_query($conectado,$isql);

    if(pg_num_rows ($resultado)>0){
        session_start();

        $_SESSION['user'] = $usuario;

        $linea = pg_fetch_array($resultado);    
        $nuevo = $linea[6];
        $documento = $linea[7];
        $seguridad = $linea[10];
        $codigo1 = $linea[3];
        $codigo2 = $linea[4];
        $codigo3 = $linea[5];
        echo "nuevo $nuevo doc $documento seg $seguridad";
    }else{
        echo "
                <script>$('.errores').slideDown('slow');</script>
            ";
    }   
   // echo "user=$user y password es $passd";
 ?>
