<?php 
    session_start();

    include ("conexion2.php");

    $user_j=$_POST['user_j'];
    $passd_j=$_POST['passd_j'];

    $isql ="select * from usuarios where login = trim(upper('$user_j')) and pass = md5('$passd_j')";
    
    $resultado = pg_query($conectado,$isql);

    if(pg_num_rows ($resultado)>0){
        session_start();

        $linea = pg_fetch_array($resultado);    

        $nombre=$linea['nombre_completo'];
        $nuevo = $linea['usuario_nuevo'];
        $perfil=$linea['perfil'];
        $estado=$linea['estado'];
        $nivel=$linea['nivel_seguridad'];
        $ventanilla_radicacion=$linea['ventanilla_radicacion'];
        
        $_SESSION['nombre'] = $nombre;
        $_SESSION['perfil'] = $perfil;
        $_SESSION['nivel'] = $nivel;   
        $_SESSION['ultimo_ingreso']=date("Y-n-j H:i:s"); 
        /*    
        echo "nombre es $nombre
        nuevo $nuevo 
        perfil es $perfil  
        estado es $estado
        nivel es $nivel
        ventanilla_radicacion es $ventanilla_radicacion
        ";
        */
       // var_dump($_SESSION);
        echo "Bienvenido a Jonas";
    }else{
        echo "";
    }   
   // echo "user=$user y password es $passd";
 ?>
